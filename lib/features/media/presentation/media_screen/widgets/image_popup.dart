import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImagePopup extends StatelessWidget {
  const ImagePopup({super.key, required this.image});

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        ),
        child: AppRoundedContainer(
          width: AppDeviceUtils.isDesktopScreen(context)
              ? MediaQuery.of(context).size.width * 0.4
              : double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    AppRoundedContainer(
                      backgroundColor: AppColors.primaryBackground,
                      child: ExtendedImage.network(
                        image.url,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: AppDeviceUtils.isDesktopScreen(context)
                            ? MediaQuery.of(context).size.width * 0.4
                            : double.infinity,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Image Name: ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      image.fileName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Image Url: ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      image.url,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      image.url,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Expanded(
                      child: OutlinedButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: image.url));
                    },
                    child: Text('Copy URL'),
                  ))
                ],
              ),
              SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Download Image',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
