import 'package:flutter/material.dart';
import 'package:islami/core/islami_styles.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double turns = 33;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sebha_bg.png'),
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 218),
          Center(
            child: Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: IslamiStyles.bodySmall.copyWith(fontSize: 36),
            ),
          ),
          SizedBox(height: 16),
          Center(child: Image.asset('assets/images/sebha_top.png')),
          InkWell(
            onTap: () {
              setState(() {
                counter++;
                turns += 1/30;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedRotation(
                  turns: turns,
                  duration: Duration(milliseconds: 500),
                  child: Image.asset('assets/images/sebha_body.png'),
                ),
                Column(
                  children: [
                    Text(
                      'سبحان الله',
                      style: IslamiStyles.bodySmall.copyWith(fontSize: 36),
                    ),
                    Text(
                      '${counter}',
                      style: IslamiStyles.bodySmall.copyWith(fontSize: 36),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 92),
        ],
      ),
    );
  }
}
