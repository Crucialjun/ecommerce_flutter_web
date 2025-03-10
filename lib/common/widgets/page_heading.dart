import 'package:flutter/material.dart';

class PageHeading extends StatelessWidget {
  const PageHeading({super.key, required this.heading, this.rightSideWidget});

  final String heading;
  final Widget? rightSideWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //breadcrumbs
        Text(heading, style: Theme.of(context).textTheme.headlineLarge),
        if (rightSideWidget != null) rightSideWidget!,
      ],
    );
  }
}
