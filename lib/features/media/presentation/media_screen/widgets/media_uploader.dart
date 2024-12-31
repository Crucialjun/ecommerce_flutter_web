import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
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
               Expanded(child: Stack(
                alignment: Alignment.center,
                children: [
                  DropzoneView(
                    operation: DragOperation.copy,
                    cursor: CursorType.grab,
                    onCreated: (ctrl) => ctrl.acceptedFiles.listen((event) {
                      print(event);
                    }),
                  ),
                ],
               ) ),        
            ],
          ),

        ),




        //locally selected Images


        ElevatedButton(
          onPressed: () {},
          child: const Text('Upload Image'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Upload Video'),
        ),
      ],
    );
  }
}