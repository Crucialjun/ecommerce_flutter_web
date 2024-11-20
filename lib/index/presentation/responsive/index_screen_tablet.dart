import 'package:flutter/material.dart';

class IndexScreenTablet extends StatelessWidget {
  const IndexScreenTablet({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(),
      body: body == null
          ? Container(
              color: Colors.deepPurple,
            )
          : body!,
    );
  }
}
