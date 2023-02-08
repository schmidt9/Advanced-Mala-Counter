import 'package:advanced_mala_counter/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'models/counter_data.dart';

// Firebase Авторизация - Сценарии:
//    Войти - Почта / Пароль
//    Личный кабинет
//    Зарегистрироваться - Почта / Пароль два раза
//        Подтвердить почту - Отправить письмо снова / Отменить
//    Сбросить пароль - Почта

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
      home: const HomeScreen(title: 'Advanced Mala Counter'),
    );
  }
}
