import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_schedule/models/weekday_events.dart';
import 'package:daily_schedule/schedule_brain.dart';
import 'package:daily_schedule/screens/weekday_panel_list.dart';
import 'package:flutter/material.dart';

class AllSchedulesPage extends StatelessWidget {
  AllSchedulesPage({Key? key}) : super(key: key);

  final ScheduleBrain _scheduleBrain = ScheduleBrain();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Schedules'),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: _scheduleBrain.getAllEvents(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              final List<WeekdayEvents> weekdayData =
                  _scheduleBrain.classifyEvents(snapshot.data!.docs);
              if (!snapshot.hasData) {
                return Container();
              }
              return WeekdayPanelList(weekdayData: weekdayData);
            },
          ),
        ),
      ),
    );
  }
}
