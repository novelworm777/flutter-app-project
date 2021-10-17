import 'package:daily_schedule/schedule_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DailySchedule());
}

class DailySchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SchedulePage(),
    );
  }
}
