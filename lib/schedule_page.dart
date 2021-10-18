import 'package:cloud_firestore/cloud_firestore.dart';
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

final FirebaseFirestore db = FirebaseFirestore.instance;

class SchedulePage extends StatelessWidget {
  SchedulePage({Key? key}) : super(key: key);

  final String weekday = DateFormat('EEEE').format(DateTime.now());
  final ScheduleBrain scheduleBrain = ScheduleBrain();
  final Future<QuerySnapshot> events =
      db.collection('events').orderBy('start').get();

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
              child: FutureBuilder(
                future: events,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return emptySchedule();
                  }
                  return ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    children: snapshot.data!.docs.map((event) {
                      return scheduleBrain.createEvent(event);
                    }).toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: 37.0)
          ],
        ),
      ),
    );
  }

  Column emptySchedule() {
    return Column(children: const [
      Center(
        child: Text(
          'There is no more schedule\ntoday!',
          textAlign: TextAlign.center,
          style: kBodyTextStyle,
        ),
      ),
      SizedBox(height: 17.0),
      Icon(Icons.mood_outlined, size: 49.0),
    ]);
  }
}
