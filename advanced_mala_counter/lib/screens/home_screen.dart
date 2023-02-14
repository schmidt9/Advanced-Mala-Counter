import 'package:advanced_mala_counter/data/counter_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/counter_data.dart';
import '../widgets/counter.dart';
import 'user_info_screen.dart';
import 'sign_in_screen.dart';

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
          PopupMenuButton(
            icon: Icon(
              Icons.menu,
              color: (user == null) ? Colors.white : Colors.yellow,
            ),
            onSelected: (value) {
              switch (value) {
                case "/add_new_counter":
                  //
                  break;
                case "/backup_and_restore":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext bc) {
              return const [
                PopupMenuItem(
                  value: '/add_new_counter',
                  child: Text("Add New Counter"),
                ),
                PopupMenuItem(
                  value: '/backup_and_restore',
                  child: Text("Backup and Restore"),
                ),
              ];
            },
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