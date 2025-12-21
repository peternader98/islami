import 'package:flutter/material.dart';
import 'package:islami/home/home.dart';
import 'package:islami/intro/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
        Home.routeName: (context) => Home(),
      },
    );
  }
}