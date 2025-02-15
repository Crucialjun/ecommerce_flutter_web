import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Heading
          Text("Product Thumbnail",
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          //Thumbnail
          AppRoundedContainer(
            height: 300,
            backgroundColor: AppColors.primaryBackground,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        size: 100,
                      ),
                      SizedBox(
                        width: AppSizes.spaceBtwItems,
                      ),
                      Text(
                        "Upload Image",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 200,
                    child: OutlinedButton(onPressed: (){}, child: Text("Add Thumbnail")),
                  ),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
