import 'package:daily_schedule/components/settings_divider.dart';
import 'package:daily_schedule/components/settings_option.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SettingsOption(
                route: '/all-schedules', title: 'View All Schedules'),
            SettingsDivider(),
            SettingsOption(route: '/event-form', title: 'Create New Event'),
            SettingsDivider(),
          ],
        ),
      ),
    );
  }
}
