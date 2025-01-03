import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/media/controller/media_controller.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/widgets/media_folder_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaController = Get.put(MediaController());
    return Column(
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
                      print('File is over the Dropzone');
                    },
                    onDropFile: (value) {},
                    onCreated: (controller) =>
                        mediaController.dropzoneViewController = controller,
                    onDropInvalid: (value) {
                      Logger().e('Invalid file type');
                    },
                    onDropFiles: (value) => Logger().i('Drop multiple'),
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
                          onPressed: () {}, child: const Text('Select Images')),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),

        //locally selected Images
        const SizedBox(height: AppSizes.spaceBtwItems),

        AppRoundedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Folders Dropdown
                      Text(
                        'Selected Folder',
                        style: Theme.of(context).textTheme.headlineSmall,
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
                          onPressed: () {}, child: const Text('Remove All')),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Upload Images'),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
