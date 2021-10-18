import 'package:daily_schedule/schedule_brain.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kWeekdayTitleStyle = TextStyle(
  fontSize: 37.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 21.0,
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
            const SizedBox(height: 21.0),
            Expanded(
              flex: 7,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                children: scheduleBrain.getSchedule().isNotEmpty
                    ? scheduleBrain.getSchedule()
                    : emptySchedule(),
              ),
            ),
            const SizedBox(height: 37.0)
          ],
        ),
      ),
    );
  }

  List<Widget> emptySchedule() {
    return [
      const Center(
        child: Text(
          'There is no more schedule\ntoday!',
          textAlign: TextAlign.center,
          style: kBodyTextStyle,
        ),
      ),
      const SizedBox(height: 17.0),
      const Icon(Icons.mood_outlined, size: 49.0),
    ];
  }
}
