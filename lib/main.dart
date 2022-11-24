import 'package:flutter/material.dart';
import 'package:tugas_besar/screens/profile.dart';
import 'screens/nav.dart';
import 'screens/detail1.dart';
import 'screens/home.dart';
import 'screens/splashscreen.dart';
import 'screens/honda.dart';

void main() async {
  runApp(const AnimeApp());
}

class AnimeApp extends StatelessWidget {
  const AnimeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motorcycle Information',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/nav': (context) => const Navigation(),
        '/home': (context) => HomePage(),
        '/honda': (context) => HondaPage(),
        '/detail1': (context) => const DetailPage1(item: '', title: ''),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
