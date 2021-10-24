import 'package:daily_schedule/screens/all_schedules_page.dart';
import 'package:daily_schedule/screens/event_form_page.dart';
import 'package:daily_schedule/screens/schedule_page.dart';
import 'package:daily_schedule/screens/setting_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DailySchedule());
}

class DailySchedule extends StatelessWidget {
  const DailySchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => SchedulePage(),
        '/settings': (context) => const SettingPage(),
        '/all-schedules': (context) => const AllSchedulesPage(),
        '/event-form': (context) => EventFormPage(),
      },
    );
  }
}
