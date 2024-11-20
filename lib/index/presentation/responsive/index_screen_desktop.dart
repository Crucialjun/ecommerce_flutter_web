import 'package:flutter/material.dart';

class IndexScreenDesktop extends StatelessWidget {
  const IndexScreenDesktop({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Container(
                  color: Colors.green,
                  height: 75,
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
