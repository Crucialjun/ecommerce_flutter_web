import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/media/controller/media_controller.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/widgets/media_content.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/widgets/media_uploader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaController = Get.put(MediaController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            AppSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //breadcrumbs
                  BreadcrumbsWithHeading(
                    heading: 'Media',
                    breadcrumbs: [],
                  ),
                  SizedBox(
                    width: AppSizes.buttonWidth * 1.5,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        mediaController.showImageUploaderSection.value =
                            !mediaController.showImageUploaderSection.value;
                      },
                      icon: Icon(Icons.add),
                      label: Text('Upload Images'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.spaceBtwSections),

             
              MediaUploader(),

              //Media content
              MediaContent(),
            ],
          ),
        ),
      ),
    );
  }
}
