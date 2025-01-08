
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:flutter/material.dart';


class CategoryTableHeader extends StatelessWidget {
  const CategoryTableHeader(
      {super.key,
      this.onPressed,
      required this.buttonText,
       this.searchController,
      this.onSearchTextChanged});

  final Function()? onPressed;
  final String buttonText;
  final TextEditingController? searchController;
  final Function(String)? onSearchTextChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: AppDeviceUtils.isDesktopScreen(context) ? 3 : 1,
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: onPressed,
                    child: Text(buttonText)),
              ),
            ],
          ),
        ),
        Expanded(
            flex: AppDeviceUtils.isDesktopScreen(context) ? 2 : 1,
            child: TextFormField(
              controller: searchController,
              onChanged: onSearchTextChanged,
              decoration: InputDecoration(
                  hintText: 'Search here...', prefixIcon: Icon(Icons.search)),
            )),
      ],
    );
  }
}
