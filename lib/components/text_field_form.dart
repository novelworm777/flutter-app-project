import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    Key? key,
    required this.name,
    required this.hint,
    this.initialValue,
  }) : super(key: key);

  final String name;
  final String hint;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13.0)),
        ),
        filled: true,
      ),
      validator: FormBuilderValidators.required(context),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
