import 'package:flutter/material.dart';
import 'package:islami/core/islami_colors.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/screens/home/tabs/hadeth_tab.dart';
import 'package:islami/screens/home/tabs/quran_tab.dart';
import 'package:islami/screens/home/tabs/radio_tab.dart';
import 'package:islami/screens/home/tabs/sebha_tab.dart';
import 'package:islami/screens/home/tabs/time_tab.dart';

class Home extends StatefulWidget {
  Home({super.key});

  static const String routeName = 'HOME';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    QuranTab(suraModel: SuraModel(nameAr: 'nameAr', nameEn: 'nameEn', versesCount: 'versesCount', index: 0),),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  Widget iconBNB(String icon, int index) {
    return selectedIndex == index
        ? Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 19),
            decoration: BoxDecoration(
              color: Color.fromRGBO(32, 32, 32, 0.6),
              borderRadius: BorderRadius.circular(66),
            ),
            child: ImageIcon(AssetImage('assets/images/$icon.png')),
          )
        : ImageIcon(AssetImage('assets/images/$icon.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: IslamiColors.white,
        unselectedItemColor: IslamiColors.black,
        backgroundColor: IslamiColors.gold,
        items: [
          BottomNavigationBarItem(
            icon: iconBNB('quran', 0),
            label: 'Quran',
            backgroundColor: IslamiColors.gold,
          ),
          BottomNavigationBarItem(
            icon: iconBNB('hadeth', 1),
            label: 'Hadeth',
            backgroundColor: IslamiColors.gold,
          ),
          BottomNavigationBarItem(
            icon: iconBNB("sebha", 2),
            label: 'Sebha',
            backgroundColor: IslamiColors.gold,
          ),
          BottomNavigationBarItem(
            icon: iconBNB('radio', 3),
            label: 'Radio',
            backgroundColor: IslamiColors.gold,
          ),
          BottomNavigationBarItem(
            icon: iconBNB('time', 4),
            label: 'Time',
            backgroundColor: IslamiColors.gold,
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          tabs[selectedIndex],
          Image.asset('assets/images/intro_title.png'),
        ],
      ),
    );
  }
}
