import 'package:daily_schedule/constants.dart';
import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13.0, top: 21.0),
      child: Text(title, style: kOptionTextStyle),
    );
  }
}
