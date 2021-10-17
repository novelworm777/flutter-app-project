import 'package:daily_schedule/event_card.dart';
import 'package:flutter/material.dart';

const List _eventColours = [
  Color(0xFFFFCDD2),
  Color(0xFFFFCCBC),
  Color(0xFFFFF9C4),
  Color(0xFFC8E6C9),
  Color(0xFFB2DFDB),
  Color(0xFFBBDEFB),
  Color(0xFFE1BEE7),
];

class ScheduleBrain {
  final int _weekday = DateTime.now().weekday;
  final int _hour = DateTime.now().hour;

  final Map<int, List<Map>> _myWeeklySchedule = {
    DateTime.monday: [
      {'eventName': 'Work Time', 'start': 10, 'end': 17},
      {'eventName': 'Flutter Study Time', 'start': 19, 'end': 22},
      {'eventName': 'Knitting Time', 'start': 22, 'end': 23},
    ],
    DateTime.tuesday: [
      {'eventName': 'Work Time', 'start': 10, 'end': 17},
      {'eventName': 'Individual Thesis Time', 'start': 19, 'end': 22},
      {'eventName': 'Flutter Study Time', 'start': 22, 'end': 23},
    ],
    DateTime.wednesday: [
      {'eventName': 'Work Time', 'start': 10, 'end': 17},
      {'eventName': 'Flutter Study Time', 'start': 19, 'end': 22},
      {'eventName': 'Knitting Time', 'start': 22, 'end': 23},
    ],
    DateTime.thursday: [
      {'eventName': 'Work Time', 'start': 10, 'end': 17},
      {'eventName': 'Individual Thesis Time', 'start': 19, 'end': 22},
      {'eventName': 'Flutter Study Time', 'start': 22, 'end': 23},
    ],
    DateTime.friday: [
      {'eventName': 'Work Time', 'start': 10, 'end': 17},
      {'eventName': 'Update Thesis Meeting', 'start': 19, 'end': 20},
      {'eventName': 'Flutter Study Time', 'start': 20, 'end': 22},
      {'eventName': 'Knitting Time', 'start': 22, 'end': 23},
    ],
    DateTime.saturday: [
      {'eventName': 'Group Thesis Time', 'start': 10, 'end': 13},
      {'eventName': 'Flutter Study Time', 'start': 14, 'end': 17},
      {'eventName': 'Flutter Study Time', 'start': 19, 'end': 21},
      {'eventName': 'Knitting Time', 'start': 22, 'end': 23},
    ],
    DateTime.sunday: [
      {'eventName': 'Group Thesis Time', 'start': 10, 'end': 13},
      {'eventName': 'Flutter Study Time', 'start': 14, 'end': 17},
      {'eventName': 'Church Time', 'start': 17, 'end': 19},
      {'eventName': 'Flutter Study Time', 'start': 20, 'end': 23},
    ],
  };

  List<EventCard> getTodaySchedule() {
    List<EventCard> todaySchedule = [];
    List<Map>? events = _myWeeklySchedule[_weekday];
    int start = 0, end = 24;

    for (var event in events!) {
      // only show on going or future events
      if (event['end'] > _hour) {
        // create a free time card when there's a gap between events
        if (start < event['start']) {
          todaySchedule.add(_createFreeTime(start, event['start']));
        }
        // there can only be 7 events at max (according to number of colours)
        int _colourIndex = events.indexOf(event);
        // create event card
        EventCard eventCard = EventCard(
          title: event['eventName'],
          time: _getTime(event['start'], event['end']),
          colour: _getColour(_colourIndex),
        );
        todaySchedule.add(eventCard);
      }
      start = event['end'];
    }

    if (start != end) todaySchedule.add(_createFreeTime(start, end));
    return todaySchedule;
  }

  String _getTime(int start, int end) => '$start - $end';

  Color _getColour(int index) => _eventColours[index];

  EventCard _createFreeTime(int start, int end) {
    return EventCard(
      title: '<<   Free Time   >>',
      time: _getTime(start, end),
    );
  }
}
