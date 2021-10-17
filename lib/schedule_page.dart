import 'package:daily_schedule/schedule_brain.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kWeekdayTitleStyle = TextStyle(
  fontSize: 37.0,
  fontWeight: FontWeight.bold,
);

class SchedulePage extends StatelessWidget {
  SchedulePage({Key? key}) : super(key: key);

  final String weekday = DateFormat('EEEE').format(DateTime.now());
  final ScheduleBrain scheduleBrain = ScheduleBrain();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  weekday,
                  textAlign: TextAlign.center,
                  style: kWeekdayTitleStyle,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
              width: 210.0,
              child: Divider(color: Colors.white),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 21.0, top: 7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: scheduleBrain.getTodaySchedule(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
