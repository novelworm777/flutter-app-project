import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;
final Future<QuerySnapshot> events = db
    .collection('events')
    .where('weekday', isEqualTo: DateFormat('EEEE').format(DateTime.now()))
    .get();
final Future<QuerySnapshot> readAllEvents =
    db.collection('events').orderBy('weekday').get();
final CollectionReference<Map> createDeleteEvent = db.collection('events');
