import 'package:ecommerce_flutter_web/common/headers/app_header.dart';
import 'package:flutter/material.dart';

class IndexScreenDesktop extends StatelessWidget {
   IndexScreenDesktop({super.key, this.body});

  final Widget? body;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        children: [
          const Expanded(
            child: Drawer(),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                 AppHeader(
                  scaffoldKey: _scaffoldKey,
                ),
                body == null
                    ? Container(
                        color: Colors.yellow,
                      )
                    : Expanded(
                        child: body!,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
