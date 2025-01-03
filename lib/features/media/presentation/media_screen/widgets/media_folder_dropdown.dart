import 'package:ecommerce_flutter_web/features/media/controller/media_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaFolderDropdown extends StatelessWidget {
  const MediaFolderDropdown({super.key, required this.onSelected});

  final void Function(String?) onSelected;

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'folders',
      'banners',
      'brands',
      'categories',
      'products',
      'users'
    ];
    final mediaController = MediaController.instance;
    return Obx(() => SizedBox(
          width: 140,
          child: DropdownButtonFormField(
              isExpanded: false,
              value: mediaController.selectedFolder.value,
              items: items
                  .map((item) => DropdownMenuItem(
                      value: item, child: Text(item.capitalize.toString())))
                  .toList(),
              onChanged: (value) {}),
        ));
  }
}
