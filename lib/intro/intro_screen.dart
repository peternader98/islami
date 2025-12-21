import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/core/islami_colors.dart';
import 'package:islami/core/islami_styles.dart';
import 'package:islami/home/home.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({super.key});

  static const String routeName = 'INTRO_SCREEN';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      skip: const Text('Skip', style: IslamiStyles.body,),
      back: const Text('Back', style: IslamiStyles.body,),
      next: const Text('Next', style: IslamiStyles.body,),
      done: const Text('Done', style: IslamiStyles.body,),
      showSkipButton: true,
      showBackButton: true,
      showNextButton: true,
      showDoneButton: true,
      onSkip: () => Navigator.pushReplacementNamed(context, Home.routeName),
      onDone: () => Navigator.pushReplacementNamed(context, Home.routeName),
      bodyPadding: EdgeInsets.only(top: 266),
      globalBackgroundColor: IslamiColors.black,
      globalHeader: Image.asset('assets/images/intro_title.png'),
      dotsDecorator: DotsDecorator(
        color: IslamiColors.gray,
        activeColor: IslamiColors.gold,
        activeSize: Size(18, 7),
        activeShape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      pages: [
        PageViewModel(
          titleWidget: Text('Welcome To Islmi App', style: IslamiStyles.title,),
          body: '',
          image: Image.asset('assets/images/intro0.png'),
        ),
        PageViewModel(
          titleWidget: Text('Welcome To Islami', style: IslamiStyles.title,),
          bodyWidget: Text('We Are Very Excited To Have You In Our Community', style: IslamiStyles.body, textAlign: TextAlign.center,),
          image: Image.asset('assets/images/intro1.png'),
        ),
        PageViewModel(
          titleWidget: Text('Reading the Quran', style: IslamiStyles.title,),
          bodyWidget: Text('Read, and your Lord is the Most Generous', style: IslamiStyles.body, textAlign: TextAlign.center,),
          image: Image.asset('assets/images/intro2.png'),
        ),
        PageViewModel(
          titleWidget: Text('Bearish', style: IslamiStyles.title,),
          bodyWidget: Text('Praise the name of your Lord, the Most High', style: IslamiStyles.body, textAlign: TextAlign.center,),
          image: Image.asset('assets/images/intro3.png'),
        ),
        PageViewModel(
          titleWidget: Text('Holy Quran Radio', style: IslamiStyles.title,),
          bodyWidget: Text('You can listen to the Holy Quran Radio through the application for free and easily', style: IslamiStyles.body, textAlign: TextAlign.center,),
          image: Image.asset('assets/images/intro4.png'),
        ),
      ],
    );
  }
}
