import 'package:advanced_mala_counter/models/counter_data.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CounterDatabase {
  static final _instance = CounterDatabase._internal();
  static CounterDatabase get instance => _instance;

  static Database? _database;
  Future<Database> get database async => _database ??= await _openDatabase();

  factory CounterDatabase() {
    return _instance;
  }

  CounterDatabase._internal();

  Future<Database> _openDatabase() async {
    // Avoid errors caused by flutter upgrade.
    // Importing 'package:flutter/widgets.dart' is required.
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE counters('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'name TEXT, '
          'created INTEGER, '
          'cycle_length INTEGER, '
          'today_count INTEGER, '
          'total_count INTEGER'
          ')',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<CounterData>> counters() async {
    // Get a reference to the database.
    final db = await CounterDatabase.instance.database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('counters');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return CounterData(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }
}
