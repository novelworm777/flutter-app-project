import 'package:daily_schedule/models/weekday_events.dart';
import 'package:daily_schedule/schedule_brain.dart';
import 'package:flutter/material.dart';

class WeekdayPanelList extends StatefulWidget {
  const WeekdayPanelList({Key? key, required this.weekdayData})
      : super(key: key);

  final List<WeekdayEvents> weekdayData;

  @override
  State<WeekdayPanelList> createState() => _WeekdayPanelListState();
}

class _WeekdayPanelListState extends State<WeekdayPanelList> {
  final ScheduleBrain _scheduleBrain = ScheduleBrain();

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 370),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget.weekdayData[index].isExpanded = !isExpanded;
        });
      },
      children: widget.weekdayData.map((data) {
        Color colour = data.isExpanded ? Colors.lightBlueAccent : Colors.white;
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
                title: Text(data.weekday, style: TextStyle(color: colour)));
          },
          body: Column(
            children: data.events.map((event) {
              return ListTile(
                title: Text(event.name),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Text('${event.start} - ${event.end}'),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      _scheduleBrain.deleteEvent(event.id!);
                    });
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            }).toList(),
          ),
          isExpanded: data.isExpanded,
        );
      }).toList(),
    );
  }
}
