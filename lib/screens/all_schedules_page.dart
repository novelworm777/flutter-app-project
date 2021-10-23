import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_schedule/models/weekday_events.dart';
import 'package:daily_schedule/schedule_brain.dart';
import 'package:daily_schedule/screens/weekday_panel_list.dart';
import 'package:flutter/material.dart';

class AllSchedulesPage extends StatefulWidget {
  const AllSchedulesPage({Key? key}) : super(key: key);

  @override
  State<AllSchedulesPage> createState() => _AllSchedulesPageState();
}

class _AllSchedulesPageState extends State<AllSchedulesPage> {
  final ScheduleBrain _scheduleBrain = ScheduleBrain();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('All Schedules')),
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: _scheduleBrain.getAllEvents().snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              final List<WeekdayEvents> weekdayData =
                  _scheduleBrain.classifyEvents(snapshot.data!.docs);
              return WeekdayPanelList(weekdayData: weekdayData);
            },
          ),
        ),
      ),
    );
  }
}
