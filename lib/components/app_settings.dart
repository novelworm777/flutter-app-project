import 'package:flutter/material.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 13.0, right: 13.0),
        child: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
            child: const Icon(
              Icons.settings,
              size: 28.0,
            ),
          ),
        ),
      ),
    );
  }
}
