import 'package:daily_schedule/components/bottom_button_form.dart';
import 'package:daily_schedule/components/dropdown_form.dart';
import 'package:daily_schedule/components/form_title.dart';
import 'package:daily_schedule/components/range_slider_form.dart';
import 'package:daily_schedule/components/text_field_form.dart';
import 'package:daily_schedule/constants.dart';
import 'package:daily_schedule/schedule_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CreateEventPage extends StatelessWidget {
  CreateEventPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();
  final _scheduleBrain = ScheduleBrain();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        // let soft input keyboard by tapping anywhere
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(title: const Text('Create Event')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormBuilder(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      FormTitle(title: 'Name'),
                      TextFieldForm(
                        name: 'name',
                        hint: 'What activity is it ...',
                      ),
                      FormTitle(title: 'Time'),
                      RangeSliderForm(
                        name: 'time',
                        min: 0,
                        max: 24,
                        initialRangeValues: RangeValues(7, 17),
                      ),
                      FormTitle(title: 'Weekday'),
                      DropdownForm(
                        name: 'weekday',
                        hint: 'Which day is it ...',
                        items: kWeekdays,
                      ),
                    ],
                  ),
                ),
              ),
              BottomButtonForm(
                onPress: () {
                  // validate
                  final validationSuccess = _formKey.currentState!.validate();

                  if (validationSuccess) {
                    _formKey.currentState!.save();
                    final formData = _formKey.currentState!.value;
                    _scheduleBrain.createEvent(formData);

                    Navigator.pop(context);
                  }
                },
                title: 'Center',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
