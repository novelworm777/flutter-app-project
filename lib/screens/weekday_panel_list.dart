import 'package:daily_schedule/models/weekday_events.dart';
import 'package:daily_schedule/schedule_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WeekdayPanelList extends StatefulWidget {
  const WeekdayPanelList({Key? key, required this.weekdayData})
      : super(key: key);

  final List<WeekdayEvents> weekdayData;

  @override
  State<WeekdayPanelList> createState() => _WeekdayPanelListState();
}

class _WeekdayPanelListState extends State<WeekdayPanelList> {
  final ScheduleBrain _scheduleBrain = ScheduleBrain();

  void handleSlideIsOpenChanged(bool? isOpen) {}

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
              return Slidable(
                child: ListTile(
                  title: Text(event.name),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Text('${event.start} - ${event.end}'),
                  ),
                ),
                actionPane: const SlidableDrawerActionPane(),
                actionExtentRatio: 0.21,
                actions: [
                  IconSlideAction(
                    caption: 'Edit',
                    icon: Icons.mode_edit,
                    color: const Color(0xFF9ccc65),
                    foregroundColor: Colors.white,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/event-form',
                        arguments: event, // send arguments to next page
                      );
                    },
                  ),
                ],
                secondaryActions: [
                  IconSlideAction(
                    caption: 'Delete',
                    icon: Icons.delete,
                    color: const Color(0xFFe57373),
                    onTap: () {
                      _scheduleBrain.deleteEvent(event.id!);
                    },
                  ),
                ],
              );
            }).toList(),
          ),
          isExpanded: data.isExpanded,
        );
      }).toList(),
    );
  }
}
