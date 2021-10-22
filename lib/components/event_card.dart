import 'package:daily_schedule/constants.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String time;
  final Color colour;

  const EventCard(
      {Key? key,
      required this.title,
      required this.time,
      this.colour = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83.0,
      child: Card(
        color: colour,
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: kTitleTextStyle),
              Text(time, style: kTimeTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
