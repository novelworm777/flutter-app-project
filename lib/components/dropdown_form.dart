import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DropdownForm extends StatelessWidget {
  const DropdownForm({
    Key? key,
    required this.name,
    required this.hint,
    required this.items,
    this.initialValue,
  }) : super(key: key);

  final String name;
  final String hint;
  final List<String> items;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      name: name,
      hint: Text(hint),
      initialValue: initialValue,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13.0)),
        ),
        filled: true,
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      validator: FormBuilderValidators.required(context),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
