import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/banners/presentation/create_banner/widgets/create_banner_form.dart';
import 'package:flutter/material.dart';

class CreateBannerDesktopScreen extends StatelessWidget {
  const CreateBannerDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BreadcrumbsWithHeading(
                returnToPrevious: true,
                heading: "Create Banner",
                breadcrumbs: ["Banners", "Create Banner"],
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              CreateBannerForm()
            ],
          ),
        ),
      ),
    );
  }
}
