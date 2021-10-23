import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class RangeSliderForm extends StatelessWidget {
  const RangeSliderForm({
    Key? key,
    required this.name,
    required this.min,
    required this.max,
    required this.initialRangeValues,
  }) : super(key: key);

  final String name;
  final double min;
  final double max;
  final RangeValues initialRangeValues;

  @override
  Widget build(BuildContext context) {
    return FormBuilderRangeSlider(
      name: name,
      min: min,
      max: max,
      initialValue: initialRangeValues,
      numberFormat: NumberFormat("0"),
      textStyle: const TextStyle(wordSpacing: 7.3),
      activeColor: const Color(0xFFffb300),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13.0)),
        ),
        filled: true,
      ),
    );
  }
}
