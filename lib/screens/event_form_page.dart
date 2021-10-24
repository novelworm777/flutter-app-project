import 'package:daily_schedule/components/bottom_button_form.dart';
import 'package:daily_schedule/components/dropdown_form.dart';
import 'package:daily_schedule/components/form_title.dart';
import 'package:daily_schedule/components/range_slider_form.dart';
import 'package:daily_schedule/components/text_field_form.dart';
import 'package:daily_schedule/constants.dart';
import 'package:daily_schedule/models/event.dart';
import 'package:daily_schedule/schedule_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EventFormPage extends StatelessWidget {
  EventFormPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();
  final _scheduleBrain = ScheduleBrain();

  @override
  Widget build(BuildContext context) {
    // receive arguments from previous page
    final args = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments as Event
        : null;
    bool isUpdate = args != null ? true : false;

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
                    children: [
                      const FormTitle(title: 'Name'),
                      TextFieldForm(
                        name: 'name',
                        hint: 'What activity is it ...',
                        initialValue: isUpdate ? args.name : null,
                      ),
                      const FormTitle(title: 'Time'),
                      RangeSliderForm(
                        name: 'time',
                        min: 0,
                        max: 24,
                        initialRangeValues: isUpdate
                            ? RangeValues(
                                args.start.toDouble(),
                                args.end.toDouble(),
                              )
                            : const RangeValues(7, 17),
                      ),
                      const FormTitle(title: 'Weekday'),
                      DropdownForm(
                        name: 'weekday',
                        hint: 'Which day is it ...',
                        items: kWeekdays,
                        initialValue: isUpdate ? args.weekday : null,
                      ),
                    ],
                  ),
                ),
              ),
              BottomButtonForm(
                onPress: () {
                  final validationSuccess = _formKey.currentState!.validate();

                  if (validationSuccess) {
                    _formKey.currentState!.save();
                    final formData = _formKey.currentState!.value;

                    isUpdate
                        ? _scheduleBrain.updateEvent(args.id, formData)
                        : _scheduleBrain.addEvent(formData);

                    Navigator.pop(context);
                  }
                },
                title: isUpdate ? 'Update' : 'Create',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
