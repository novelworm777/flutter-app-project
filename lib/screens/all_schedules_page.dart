import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_schedule/models/weekday_events.dart';
import 'package:daily_schedule/schedule_brain.dart';
import 'package:daily_schedule/screens/weekday_panel_list.dart';
import 'package:flutter/material.dart';

class AllSchedulesPage extends StatefulWidget {
  AllSchedulesPage({Key? key}) : super(key: key);

  final ScheduleBrain _scheduleBrain = ScheduleBrain();

  @override
  State<AllSchedulesPage> createState() => _AllSchedulesPageState();
}

class _AllSchedulesPageState extends State<AllSchedulesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('All Schedules')),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: widget._scheduleBrain.getAllEvents(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              final List<WeekdayEvents> weekdayData =
                  widget._scheduleBrain.classifyEvents(snapshot.data!.docs);
              return WeekdayPanelList(weekdayData: weekdayData);
            },
          ),
        ),
      ),
    );
  }
}
