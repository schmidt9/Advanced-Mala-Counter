import 'package:advanced_mala_counter/screens/user_info_screen.dart';
import 'package:advanced_mala_counter/screens/home_screen.dart';
import 'package:advanced_mala_counter/screens/sign_in_screen.dart';
import 'package:advanced_mala_counter/services/firebase_stream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

/// https://github.com/stolets-k-od/flutter_firebase_auth/blob/main/lib/main.dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Mala Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => const HomeScreen(), // TODO: fix
        '/account': (context) => UserInfoScreen(user: user!), // TODO: check
        '/login': (context) => const SignInScreen()
      },
      initialRoute: '/home',
    );
  }
}
