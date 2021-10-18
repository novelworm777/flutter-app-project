import 'package:daily_schedule/event_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final String _weekday = DateFormat('EEEE').format(DateTime.now());
  final int _hour = DateTime.now().hour;

  final List<Map> _events = [
    {'name': 'Work Time', 'start': 9, 'end': 17, 'weekday': 'Monday'},
    {'name': 'Flutter Study Time', 'start': 19, 'end': 22, 'weekday': 'Monday'},
    {'name': 'Knitting Time', 'start': 22, 'end': 23, 'weekday': 'Monday'},
  ];

  List<EventCard> getSchedule() {
    List<EventCard> schedule = [];
    int colourIndex = 0;

    for (var event in _events) {
      // only show on going or future events
      if (event['end'] <= _hour) continue;
      print('aa');
      EventCard eventCard = EventCard(
        title: event['name'],
        time: _getTime(event['start'], event['end']),
        colour: _getColour(colourIndex),
      );
      // there can only be 7 events at max (according to number of colours)
      colourIndex = _increaseIndex(colourIndex);
      schedule.add(eventCard);
    }

    return schedule;
  }

  String _getTime(int start, int end) => '$start - $end';

  Color _getColour(int index) => _eventColours[index];

  int _increaseIndex(int colourIndex) =>
      colourIndex + 1 == _eventColours.length ? 0 : colourIndex + 1;
}
