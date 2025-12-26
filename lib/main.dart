import 'package:flutter/material.dart';
import 'package:islami/core/cache_helper.dart';
import 'package:islami/screens/home/home.dart';
import 'package:islami/screens/home/sura_details/sura_details.dart';
import 'package:islami/screens/home/tabs/quran_tab.dart';
import 'package:islami/screens/intro/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool? value = CacheHelper.getBool('intro_screen');
    return MaterialApp(
      title: 'Islami',
      debugShowCheckedModeBanner: false,
      initialRoute: value == true ? Home.routeName : IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
        Home.routeName: (context) => Home(),
        QuranTab.routeName: (context) => QuranTab(),
        SuraDetails.routeName: (context) => SuraDetails(),
      },
    );
  }
}