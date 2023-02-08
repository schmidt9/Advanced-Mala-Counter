import 'package:flutter/material.dart';
import '../models/counter_data.dart';
import '../widgets/counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _counters = List.empty(growable: true);

  void _addCounter() {
    setState(() {
      _counters.add(const CounterData(
          title: 'Title',
          created: 0,
          cycleLength: 0,
          todayCount: 0,
          totalCount: 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  Theme.of(context).buttonTheme.colorScheme?.background,
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
      floatingActionButton: FloatingActionButton(
        // TODO: remove
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}