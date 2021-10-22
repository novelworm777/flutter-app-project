import 'package:daily_schedule/models/event.dart';

class WeekdayEvents {
  List<Event> events;
  String weekday;
  bool isExpanded;

  WeekdayEvents(
      {required this.events, required this.weekday, this.isExpanded = false});
}
