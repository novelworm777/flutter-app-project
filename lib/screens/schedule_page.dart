import 'package:daily_schedule/components/app_settings.dart';
import 'package:daily_schedule/constants.dart';
import 'package:daily_schedule/schedule_brain.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key}) : super(key: key);

  final String weekday = DateFormat('EEEE').format(DateTime.now());
  final ScheduleBrain _scheduleBrain = ScheduleBrain();

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.weekday,
                          textAlign: TextAlign.center,
                          style: kWeekdayTitleStyle,
                        ),
                        const SizedBox(height: 7.0),
                        const SizedBox(
                          height: 10.0,
                          width: 210.0,
                          child: Divider(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const AppSettings(),
                ],
              ),
            ),
            const SizedBox(height: 21.0),
            Expanded(
              flex: 10,
              child: widget._scheduleBrain.getEvents(),
            ),
            const SizedBox(height: 37.0)
          ],
        ),
      ),
    );
  }
}
