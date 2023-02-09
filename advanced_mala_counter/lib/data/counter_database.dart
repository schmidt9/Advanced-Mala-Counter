import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/counter_data.dart';

class CounterDatabase {

  static void addCounter(CounterData counterData, User? user) {

     if (user == null) {
       return;
     }

    final db = FirebaseFirestore.instance;

    db.collection("counters").doc(user.uid).set(counterData.toMap());
    db.collection("counters").add(counterData.toMap()).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

}
