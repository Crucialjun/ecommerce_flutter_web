import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:flutter/material.dart';

class ProductBottomNavigationButtons extends StatelessWidget {
  const ProductBottomNavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                print("Cancel");
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                print("Save");
              },
              child: Text("Save"),
            ),
          ],
        ),
    );
  }
}
