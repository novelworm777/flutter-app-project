import 'package:daily_schedule/constants.dart';
import 'package:daily_schedule/schedule_brain.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 7,
                    child: Text(
                      weekday,
                      textAlign: TextAlign.center,
                      style: kWeekdayTitleStyle,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 7.0, right: 7.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/settings');
                          },
                          child: const Icon(
                            Icons.settings,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
              width: 210.0,
              child: Divider(color: Colors.white),
            ),
            const SizedBox(height: 21.0),
            Expanded(
              flex: 7,
              child: scheduleBrain.getEvents(),
            ),
            const SizedBox(height: 37.0)
          ],
        ),
      ),
    );
  }
}
