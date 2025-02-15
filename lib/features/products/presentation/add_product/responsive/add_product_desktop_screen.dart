import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/components/product_additional_images.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/components/product_attributes.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/components/product_bottom_navigation_buttons.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/components/product_brand.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/components/product_categories.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/components/product_stock_and_pricing.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/components/product_thumbnail.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/components/product_title_and_description.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/components/product_type_widget.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/components/product_variations.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/components/product_visibility_widget.dart';
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class AddProductDesktopScreen extends StatelessWidget {
  const AddProductDesktopScreen({super.key});

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
                  heading: "Create Product",
                  breadcrumbs: ["Products", "Create Product"],
                ),
                SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: AppDeviceUtils.isTabletScreen(context) ? 2 : 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductTitleAndDescription(),
                            SizedBox(
                              height: AppSizes.spaceBtwSections,
                            ),
                            AppRoundedContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Heading
                                  Text("Stock & Pricing"),
                                  SizedBox(
                                    height: AppSizes.spaceBtwItems,
                                  ),

                                  //Product Type
                                  ProductTypeWidget(),
                                  SizedBox(
                                    height: AppSizes.spaceBtwInputFields,
                                  ),

                                  //Stock
                                  ProductStockAndPricing(),
                                  SizedBox(
                                    height: AppSizes.spaceBtwSections,
                                  ),

                                  //Attributes
                                  ProductAttributes(),
                                  SizedBox(
                                    height: AppSizes.spaceBtwSections,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: AppSizes.spaceBtwSections,
                            ),

                            //Variations
                            ProductVariations()
                          ],
                        )),
                    SizedBox(
                      width: AppSizes.defaultSpace,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        ProductThumbnail(),
                        SizedBox(
                          height: AppSizes.spaceBtwSections,
                        ),

                        //Product Images
                        AppRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("All Product Images",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              SizedBox(
                                height: AppSizes.spaceBtwItems,
                              ),
                              //ProductAdditionalImages(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.spaceBtwSections,
                        ),

                        //Product Brand
                        ProductBrand(),

                        SizedBox(
                          height: AppSizes.spaceBtwSections,
                        ),

                        //Product Categories
                        ProductCategories(),
                        SizedBox(
                          height: AppSizes.spaceBtwSections,
                        ),

                        //Product Visibility
                        ProductVisibilityWidget(),
                        SizedBox(
                          height: AppSizes.spaceBtwSections,
                        ),
                      ],
                    )),
                  ],
                )
              ],
            )),
      ),
      //bottomNavigationBar: ProductBottomNavigationButtons(),
    );
  }
}
