import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subcribe/core/cubit/base_cubit_state.dart';
import 'package:subcribe/core/model/slides_model.dart';

import '../../../../core/const/api_consts.dart';

class PdfSummaryBloc extends Cubit<BaseCubitState> {
  PdfSummaryBloc() : super(BaseCubitState.initial);
  String pdfSummary = '';
  SlidesModel? slidesModel;
  Future<void> uploadPDF() async {
    final dio = Dio();

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        emit(BaseCubitState.loading);

        final file = File(result.files.single.path!);

        final formData = FormData.fromMap({
          'pdf_file': await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
          'image_description': true,
          'ocr': false
        });

        final response = await dio.post(
          EndPoints.extractPDF,
          data: formData,
          options: Options(headers: {'Content-Type': 'multipart/form-data'}),
        );

        if (response.statusCode == 200) {
          debugPrint('Upload successful: ${response.data}');
          pdfSummary = response.data['text_content'];
          emit(BaseCubitState.done);
        } else {
          debugPrint('Failed to upload: ${response.statusMessage}');
          emit(BaseCubitState.error);
        }
      } else {
        debugPrint('User canceled the file picking.');
      }
    } catch (e) {
      emit(BaseCubitState.error);

      debugPrint('Error: $e');
    }
  }

  Future<void> uploadPTXX() async {
    final dio = Dio();

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pptx'],
      );

      if (result != null) {
        emit(BaseCubitState.loading);

        final file = File(result.files.single.path!);

        final formData = FormData.fromMap({
          'pptx_file': await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        });

        final response = await dio.post(
          EndPoints.extractPTXX,
          data: formData,
          options: Options(headers: {'Content-Type': 'multipart/form-data'}),
        );
        if (response.statusCode == 200) {
          slidesModel = SlidesModel.fromJson(response.data);
          emit(BaseCubitState.done);
        } else {
          debugPrint('Failed to upload: ${response.statusMessage}');
          emit(BaseCubitState.error);
        }
      } else {
        debugPrint('User canceled the file picking.');
      }
    } catch (e) {
      emit(BaseCubitState.error);

      debugPrint('Error: $e');
    }
  }
}
