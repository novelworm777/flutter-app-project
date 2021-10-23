import 'package:daily_schedule/constants.dart';
import 'package:flutter/material.dart';

class BottomButtonForm extends StatelessWidget {
  const BottomButtonForm({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 17.0),
        decoration: const BoxDecoration(
          color: Color(0xFFffb300),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13.0),
            topRight: Radius.circular(13.0),
          ),
        ),
        child: Center(child: Text(title, style: kButtonTextStyle)),
      ),
    );
  }
}
