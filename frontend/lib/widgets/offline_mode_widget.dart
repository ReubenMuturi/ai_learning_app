// offline_mode_widget.dart
import 'package:flutter/material.dart';

class OfflineModeWidget extends StatelessWidget {
  final bool isOffline;

  const OfflineModeWidget({super.key, required this.isOffline});

  @override
  Widget build(BuildContext context) {
    return isOffline
        ? Container(
            color: Colors.red,
            padding: EdgeInsets.all(10),
            child: Text(
              "You are offline. Some features may be limited.",
              style: TextStyle(color: Colors.white),
            ),
          )
        : Container();
  }
}
