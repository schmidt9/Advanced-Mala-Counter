import 'package:advanced_mala_counter/data/counter_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/counter_data.dart';
import '../widgets/counter.dart';
import 'account_screen.dart';
import 'login_screen.dart';

/// https://github.com/stolets-k-od/flutter_firebase_auth/blob/main/lib/screens/home_screen.dart
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _counters = List.empty(growable: true);

  void _addCounter() {
    setState(() {
      final counterData = CounterData(
          title: 'Title',
          created: DateTime.now().microsecondsSinceEpoch,
          cycleLength: 108,
          todayCount: 0,
          totalCount: 0);

      _counters.add(counterData);

      CounterDatabase.addCounter(counterData, null); // TODO: fix user
    });
  }

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Mala Counter'),
        actions: [
          IconButton(
            onPressed: () {
              if ((user == null)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
              }
            },
            icon: Icon(
              Icons.person,
              color: (user == null) ? Colors.white : Colors.yellow,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  Theme.of(context).buttonTheme.colorScheme?.primary,
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: () {
                  _addCounter();
                },
                child: const Text('Add New Counter'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    for (final counterData in _counters)
                      Counter(counterData: counterData),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}