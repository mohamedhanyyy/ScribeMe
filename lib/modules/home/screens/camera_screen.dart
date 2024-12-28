// Flutter code to open the camera automatically when entering a screen
// Assumes the use of the image_picker package

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subcribe/core/cubit/base_cubit_state.dart';
import 'package:subcribe/shared/widgets/custom_button.dart';
import 'package:subcribe/shared/widgets/custom_loading_widget.dart';

import '../../scan/presentation/cubit/image_summary_bloc.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    super.initState();
    imageSummaryCubit = context.read<ImageSummaryCubit>();
  }

  late ImageSummaryCubit imageSummaryCubit;
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ImageSummaryCubit, BaseCubitState>(
          builder: (context, state) {
        return
          selectedImage == null
              ?   Center(child: Text('no image please pick one'.tr()))
              : SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Center(
                            child: Image.file(File(selectedImage!.path)))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: state == BaseCubitState.loading
                          ? const CustomLoadingButtonWidget()
                          : CustomElevatedButton(
                              onTap: () async {
                                if(selectedImage!=null) {
                                  await imageSummaryCubit
                                      .scanImage(selectedImage!);
                                }
                              },
                              buttonText: 'Scan image',
                            ),
                    ),
                    const SizedBox(height: 20),
                    Text(imageSummaryCubit.imageDescription),
                  ],
                ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Flexible(
              child: CustomElevatedButton(
                onTap: () async {
                  final image = await imageSummaryCubit.picker
                      .pickImage(source: ImageSource.camera);
                  if (image != null) {
                    selectedImage = image;
                    setState(() {});
                  }
                },
                buttonText: 'Open Camera',
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: CustomElevatedButton(
                onTap: () async {
                  final image = await imageSummaryCubit.picker
                      .pickImage(source: ImageSource.gallery);

                  if (image != null) {
                    selectedImage = image;
                    setState(() {});
                  }
                },
                buttonText: 'Pick from gallery',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
