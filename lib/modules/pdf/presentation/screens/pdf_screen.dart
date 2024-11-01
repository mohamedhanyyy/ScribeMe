import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subcribe/core/cubit/base_cubit_state.dart';
import 'package:subcribe/modules/pdf/presentation/cubit/pdf_bloc.dart';
import 'package:subcribe/shared/widgets/custom_button.dart';
import 'package:subcribe/shared/widgets/custom_loading_widget.dart';

import '../cubit/image_summary_bloc.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  late PdfSummaryBloc pdfCubit;
  late ImageSummaryBloc imageSummaryBloc;
  @override
  void initState() {
    super.initState();
    pdfCubit = context.read<PdfSummaryBloc>();
    imageSummaryBloc = context.read<ImageSummaryBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("   Get summary from File or image",
              style: TextStyle(fontSize: 15)),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<ImageSummaryBloc, BaseCubitState>(
                  builder: (context, state) {
                    if (state == BaseCubitState.loading) {
                      return const Center(child: CustomLoadingButtonWidget());
                    }

                    return Column(
                      children: [
                        CustomElevatedButton(
                          onTap: () => showImageSourceDialog(),
                          buttonText: ("Upload Image"),
                        ),
                        if (state == BaseCubitState.done &&
                            imageSummaryBloc.imageDescription.isNotEmpty)
                          Text(imageSummaryBloc.imageDescription),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<PdfSummaryBloc, BaseCubitState>(
                  builder: (context, state) {
                    if (state == BaseCubitState.loading) {
                      return const CustomLoadingButtonWidget();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomElevatedButton(
                          onTap: () {
                            pdfCubit.uploadPDF();
                          },
                          buttonText: 'Upload PDF',
                        ),
                        const SizedBox(height: 20),
                        CustomElevatedButton(
                          onTap: () {
                            context.read<PdfSummaryBloc>().uploadPTXX();
                          },
                          buttonText: 'Upload PTXX',
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "PDF Summary",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 400,
                          child: SingleChildScrollView(
                            child: Text(pdfCubit.pdfSummary,
                                style: const TextStyle(fontSize: 15)),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        if (pdfCubit.slidesModel?.slidesText?.isNotEmpty ==
                            true)
                          const Text(
                            "PTXX Summary",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w700),
                          ),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final slide =
                                  pdfCubit.slidesModel?.slidesText?[index];
                              return Text("*$slide");
                            },
                            shrinkWrap: true,
                            itemCount:
                                pdfCubit.slidesModel?.slidesText?.length ?? 0,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
