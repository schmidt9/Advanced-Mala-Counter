import 'package:advanced_mala_counter/screens/account_screen.dart';
import 'package:advanced_mala_counter/screens/home_screen.dart';
import 'package:advanced_mala_counter/screens/login_screen.dart';
import 'package:advanced_mala_counter/screens/reset_password_screen.dart';
import 'package:advanced_mala_counter/screens/signup_screen.dart';
import 'package:advanced_mala_counter/screens/verify_email_screen.dart';
import 'package:advanced_mala_counter/services/firebase_stream.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Firebase Авторизация - Сценарии:
//    Войти - Почта / Пароль
//    Личный кабинет
//    Зарегистрироваться - Почта / Пароль два раза
//        Подтвердить почту - Отправить письмо снова / Отменить
//    Сбросить пароль - Почта
/// https://github.com/stolets-k-od/flutter_firebase_auth/blob/main/lib/main.dart
///
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Mala Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        '/': (context) => const FirebaseStream(),
        '/home': (context) => const HomeScreen(),
        '/account': (context) => const AccountScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/reset_password': (context) => const ResetPasswordScreen(),
        '/verify_email': (context) => const VerifyEmailScreen(),
      },
      initialRoute: '/',
    );
  }
}
