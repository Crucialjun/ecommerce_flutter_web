import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmerEffect extends StatelessWidget {
  const AppShimmerEffect(
      {super.key,
      required this.height,
      required this.width,
      this.radius = 15,
      this.color});

  final double height, width, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
        baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color ?? (dark ? AppColors.darkerGrey : AppColors.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        ));
  }
}
