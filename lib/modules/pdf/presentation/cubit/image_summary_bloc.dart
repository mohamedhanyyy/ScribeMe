import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subcribe/core/const/api_consts.dart';
import 'package:subcribe/core/cubit/base_cubit_state.dart';

import 'package:flutter/material.dart';
import 'package:subcribe/services/navigation/navigation.dart';

void showImageSourceDialog() {
  showDialog(
    context: AppNavigation.context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Choose Image Source"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () {
                Navigator.of(context).pop();
                context
                    .read<ImageSummaryBloc>()
                    .pickAndUploadImage(fromGallery: false);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.of(context).pop();
                context
                    .read<ImageSummaryBloc>()
                    .pickAndUploadImage(fromGallery: true);
              },
            ),
          ],
        ),
      );
    },
  );
}

class ImageSummaryBloc extends Cubit<BaseCubitState> {
  ImageSummaryBloc() : super(BaseCubitState.initial);

  final picker = ImagePicker();
  String imageDescription = '';

  Future<void> pickAndUploadImage({required bool fromGallery}) async {
    final dio = Dio();

    try {
      final image = await picker.pickImage(
          source: fromGallery ? ImageSource.gallery : ImageSource.camera);

      if (image != null) {
        emit(BaseCubitState.loading);

        final file = File(image.path);

        final formData = FormData.fromMap({
          'image': await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        });

        final response = await dio.post(
          EndPoints.uploadImage,
          data: formData,
          options: Options(headers: {'Content-Type': 'multipart/form-data'}),
        );

        if (response.statusCode == 200) {
          debugPrint('Upload successful: ${response.data}');
          imageDescription = response.data['description'];
          emit(BaseCubitState.done);
        } else {
          debugPrint('Failed to upload: ${response.statusMessage}');
          emit(BaseCubitState.error);
        }
      } else {
        debugPrint('User canceled the image picking.');
      }
    } catch (e) {
      emit(BaseCubitState.error);
      debugPrint('Error: $e');
    }
  }
}
