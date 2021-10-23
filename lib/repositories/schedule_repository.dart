import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;
final Query<Map<String, dynamic>> events = db
    .collection('events')
    .where('weekday', isEqualTo: DateFormat('EEEE').format(DateTime.now()));
final Query<Map<String, dynamic>> readAllEvents =
    db.collection('events').orderBy('weekday');
final CollectionReference<Map> createDeleteEvent = db.collection('events');
