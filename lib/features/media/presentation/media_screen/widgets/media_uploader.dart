import 'dart:typed_data';

import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/controller/media_controller.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/widgets/media_folder_dropdown.dart';
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:universal_html/html.dart' as html;

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaController = MediaController.instance;
    return Obx(() => mediaController.showImageUploaderSection.value
        ? Column(
            children: [
              //drag and drop area
              AppRoundedContainer(
                showBorder: true,
                height: 250,
                borderColor: AppColors.borderPrimary,
                backgroundColor: AppColors.primaryBackground,
                padding: EdgeInsets.all(AppSizes.defaultSpace),
                child: Column(
                  children: [
                    Expanded(
                        child: Stack(
                      alignment: Alignment.center,
                      children: [
                        DropzoneView(
                          mime: [
                            'image/jpeg',
                            'image/png',
                          ],
                          cursor: CursorType.Default,
                          operation: DragOperation.copy,
                          onHover: () {
                            Logger().i('File is over the Dropzone');
                          },
                          onDropFile: (value) async {
                            if (value is html.File) {
                              Logger().i('Dropped file: ${value.name}');
                              final bytes = await mediaController
                                  .dropzoneViewController
                                  .getFileData(value);
                              final image = ImageModel(
                                fileName: value.name,
                                url: "",
                                file: bytes,
                                folder: "",
                                localImageToDisplay: Uint8List.fromList(bytes),
                              );
                              mediaController.selectedImagesToUpload.add(image);
                            }
                          },
                          onCreated: (controller) => mediaController
                              .dropzoneViewController = controller,
                          onDropInvalid: (value) {
                            Logger().e('Invalid file type');
                          },
                          onDropFiles: (value) async {
                            if (value != null && value.isNotEmpty) {
                              for (final file in value) {
                                Logger().i('Dropped file: ${file.name}');
                                final bytes = await mediaController
                                    .dropzoneViewController
                                    .getFileData(file);

                                final image = ImageModel(
                                  fileName: file.name,
                                  url: "",
                                  file: bytes,
                                  folder: "",
                                  localImageToDisplay:
                                      Uint8List.fromList(bytes),
                                );
                                mediaController.selectedImagesToUpload
                                    .add(image);
                              }
                            }
                          },
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.cloud_upload,
                              size: 50,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(height: AppSizes.spaceBtwItems),
                            Text(
                              'Drag and drop images here here',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: AppSizes.spaceBtwItems),
                            OutlinedButton(
                                onPressed: () {
                                  mediaController.selectLocalImages();
                                },
                                child: const Text('Select Images')),
                          ],
                        )
                      ],
                    )),
                  ],
                ),
              ),

              //locally selected Images
              const SizedBox(height: AppSizes.spaceBtwItems),
              if (mediaController.selectedImagesToUpload.isNotEmpty)
                AppRoundedContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Folders Dropdown
                              Text(
                                'Selected Folder',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(
                                width: AppSizes.spaceBtwItems,
                              ),
                              MediaFolderDropdown(
                                onSelected: (p0) {
                                  if (p0 != null) {
                                    mediaController.selectedFolder.value = p0;
                                  }
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: AppSizes.spaceBtwItems),
                              TextButton(
                                  onPressed: () {
                                    mediaController.selectedImagesToUpload
                                        .clear();
                                  },
                                  child: const Text('Remove All')),
                              SizedBox(
                                width: AppSizes.spaceBtwItems,
                              ),
                              AppDeviceUtils.isMobileScreen(context)
                                  ? const SizedBox.shrink()
                                  : SizedBox(
                                      width: AppSizes.buttonWidth,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          mediaController.uploadImagesConfirm();
                                        },
                                        child: const Text('Upload'),
                                      ),
                                    ),
                            ],
                          ),
                          SizedBox(
                            width: AppSizes.spaceBtwItems,
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.spaceBtwItems),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: AppSizes.spaceBtwItems / 2,
                        runSpacing: AppSizes.spaceBtwItems / 2,
                        children: mediaController.selectedImagesToUpload
                            .where((image) => image.localImageToDisplay != null)
                            .map((image) {
                          return Container(
                            width: 90,
                            height: 90,
                            padding: EdgeInsets.all(AppSizes.sm),
                            decoration: BoxDecoration(
                                color: AppColors.primaryBackground),
                            child: ExtendedImage.memory(
                              image.localImageToDisplay!,
                              fit: BoxFit.contain,
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),
                      !AppDeviceUtils.isMobileScreen(context)
                          ? const SizedBox.shrink()
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  mediaController.uploadImagesConfirm();
                                },
                                child: const Text('Upload'),
                              ),
                            ),
                    ],
                  ),
                )
            ],
          )
        : const SizedBox.shrink());
  }
}
