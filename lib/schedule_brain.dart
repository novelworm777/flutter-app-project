import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_schedule/constants.dart';
import 'package:daily_schedule/components/event_card.dart';
import 'package:daily_schedule/models/event.dart';
import 'package:daily_schedule/models/weekday_events.dart';
import 'package:daily_schedule/repositories/schedule_repository.dart';
import 'package:flutter/material.dart';

class ScheduleBrain {
  Widget getEvents() {
    return FutureBuilder(
      future: events,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return _emptySchedule();
        }
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          children: _processEvents(snapshot.data!.docs),
        );
      },
    );
  }

  Column _emptySchedule() {
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

  final int _hour = DateTime.now().hour;

  List<Widget> _processEvents(List<QueryDocumentSnapshot> snapshots) {
    // filter event that has passed
    List<QueryDocumentSnapshot> filtered =
        snapshots.where((event) => event['end'] > _hour).toList();

    // sort event based on start time
    filtered.sort((a, b) => a['start'] - b['start']);

    // create event card
    if (filtered.isNotEmpty) {
      return filtered.map((event) => _createEvent(event)).toList();
    }
    // empty event
    else {
      return [_emptySchedule()];
    }
  }

  EventCard _createEvent(QueryDocumentSnapshot event) {
    return EventCard(
      title: event['name'],
      time: _getTime(event['start'], event['end']),
      colour: _getColour(_colourIndex),
    );
  }

  String _getTime(int start, int end) => '$start - $end';

  int _colourIndex = 0;

  Color _getColour(int index) {
    _increaseIndex();
    return kEventColours[index];
  }

  // there can only be 7 events at max (according to number of colours)
  _increaseIndex() => _colourIndex =
      _colourIndex + 1 == kEventColours.length ? 0 : _colourIndex + 1;

  Future<QuerySnapshot> getAllEvents() => rAllEvents;

  List<WeekdayEvents> classifyEvents(List<QueryDocumentSnapshot> snapshots) {
    List<WeekdayEvents> allSchedules = [];
    List<String> weekdays = kWeekdays;

    for (String weekday in weekdays) {
      // filter event per weekday
      List<QueryDocumentSnapshot> filtered =
          snapshots.where((event) => event['weekday'] == weekday).toList();

      if (filtered.isEmpty) continue;

      // create list of events
      List<Event> events = filtered
          .map((event) => Event(
              id: event.id,
              name: event['name'],
              start: event['start'],
              end: event['end'],
              weekday: event['weekday']))
          .toList();

      // create weekday object
      WeekdayEvents weekdayEvents =
          WeekdayEvents(events: events, weekday: weekday);
      allSchedules.add(weekdayEvents);
    }

    return allSchedules;
  }

  Future deleteEvent(String id) => cudAllEvents.doc(id).delete();

  addEvent(Event event) {
    List<String> attributes = event.getClassAttributes();
    Map newDocument = {};
    for (String field in attributes) {
      newDocument[field] = event.getAttributeValueOf(field);
    }
    print(newDocument);
  }
}
