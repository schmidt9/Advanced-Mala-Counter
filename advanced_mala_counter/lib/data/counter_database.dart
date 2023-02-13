import 'package:firebase_auth/firebase_auth.dart';
import '../models/counter_data.dart';

class CounterDatabase {

  static void addCounter(CounterData counterData, User? user) {

     if (user == null) {
       return;
     }

     // TODO: impl
  }

}
