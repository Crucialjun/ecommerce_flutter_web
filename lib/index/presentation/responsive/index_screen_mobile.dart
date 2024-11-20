import 'package:ecommerce_flutter_web/common/headers/app_header.dart';
import 'package:flutter/material.dart';

class IndexScreenMobile extends StatelessWidget {
  IndexScreenMobile({super.key, this.body});

  final Widget? body;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(),
      appBar: AppHeader(
        scaffoldKey: _scaffoldKey,
      ),
      body: body == null
          ? Container(
              color: Colors.pink,
            )
          : body!,
    );
  }
}
