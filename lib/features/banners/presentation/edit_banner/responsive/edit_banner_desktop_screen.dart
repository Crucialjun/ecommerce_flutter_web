import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/banners/presentation/edit_banner/widgets/edit_banner_form.dart';
import 'package:flutter/material.dart';

class EditBannerDesktopScreen extends StatelessWidget {
  const EditBannerDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BreadcrumbsWithHeading(
                returnToPrevious: true,
                heading: "Edit Banner",
                breadcrumbs: ["Banners", "Edit Brand"],
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              EditBannerForm(),
            ],
          ),
        ),
      ),
    );
  }
}
