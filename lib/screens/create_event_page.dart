import 'package:daily_schedule/models/event.dart';
import 'package:daily_schedule/schedule_brain.dart';
import 'package:flutter/material.dart';

class CreateEventPage extends StatelessWidget {
  CreateEventPage({Key? key}) : super(key: key);

  final ScheduleBrain _scheduleBrain = ScheduleBrain();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: GestureDetector(
            onTap: () {
              Event event =
                  Event(name: 'Test', start: 1, end: 2, weekday: 'Monday');
              _scheduleBrain.addEvent(event);
            },
            child: const Text('Add Me!'),
          ),
        ),
      ),
    );
  }
}
