import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class AppTableHeader extends StatelessWidget {
  const AppTableHeader(
      {super.key,
      this.buttonText = "Add",
      this.onPressed,
      this.showLeftWidget = true,
      this.searchOnChanged,
      this.searchController});

  final String buttonText;
  final Function()? onPressed;
  final bool showLeftWidget;
  final Function(String)? searchOnChanged;
  final TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: AppDeviceUtils.isDesktopScreen(context) ? 3 : 1,
            child: showLeftWidget
                ? Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text(buttonText)),
                      )
                    ],
                  )
                : SizedBox.shrink()),
        Expanded(
            flex: AppDeviceUtils.isDesktopScreen(context) ? 2 : 1,
            child: TextFormField(
              controller: searchController,
              onChanged: searchOnChanged,
              decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ))
      ],
    );
  }
}
