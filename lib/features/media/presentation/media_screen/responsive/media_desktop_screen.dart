import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/widgets/media_content.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/widgets/media_uploader.dart';
import 'package:flutter/material.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text('Upload Images'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.spaceBtwSections),

              //Uploade area
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
