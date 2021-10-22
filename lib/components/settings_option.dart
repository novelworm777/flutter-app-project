import 'package:daily_schedule/constants.dart';
import 'package:flutter/material.dart';

class SettingsOption extends StatelessWidget {
  final String route;
  final String title;

  const SettingsOption({Key? key, required this.route, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 17.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(
          title,
          style: kOptionTextStyle,
        ),
      ),
    );
  }
}
