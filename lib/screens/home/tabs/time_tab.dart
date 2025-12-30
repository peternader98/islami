import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/islami_colors.dart';
import 'package:islami/core/islami_styles.dart';
import 'package:islami/models/pray_time_model.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<PrayTimeModel> praiesTime = [
      PrayTimeModel(prayName: 'Sunrise', prayTime: '01:04', prayAMPM: 'PM'),
      PrayTimeModel(prayName: 'Dhuhr', prayTime: '01:01', prayAMPM: 'PM'),
      PrayTimeModel(prayName: 'ASR', prayTime: '04:38', prayAMPM: 'PM'),
      PrayTimeModel(prayName: 'Maghrib', prayTime: '07:57', prayAMPM: 'PM'),
      PrayTimeModel(prayName: 'Isha', prayTime: '09:57', prayAMPM: 'PM'),
    ];

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/time_bg.png'),
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 180),
              Container(
                width: 390,
                height: 300,
                decoration: BoxDecoration(
                  color: IslamiColors.brown,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Image.asset('assets/images/left_angle.png'),
                                  SizedBox(
                                    width: 97.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('16 Jul,', style: IslamiStyles.bodySmall,),
                                        Text('2024', style: IslamiStyles.bodySmall,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: IslamiColors.gold,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Pray Time', style: IslamiStyles.body.copyWith(color: IslamiColors.black),),
                                  Text('Tuesday', style: IslamiStyles.body.copyWith(color: IslamiColors.black),),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                ),

                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Image.asset('assets/images/right_angle.png'),
                                  SizedBox(
                                    width: 97.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('09 Muh,', style: IslamiStyles.bodySmall,),
                                        Text('1446', style: IslamiStyles.bodySmall,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 225,
                      decoration: BoxDecoration(
                        color: IslamiColors.gold,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 130,
                              enlargeCenterPage: true,
                              viewportFraction: 0.3,
                            ),
                            items: praiesTime.map((item) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 105,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          IslamiColors.black,
                                          Colors.transparent,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item.prayName,
                                        style: IslamiStyles.bodySmall,
                                      ),
                                      Text(
                                        item.prayTime,
                                        style: IslamiStyles.bodySmall.copyWith(
                                          fontSize: 32,
                                        ),
                                      ),
                                      Text(
                                        item.prayAMPM,
                                        style: IslamiStyles.bodySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 24, height: 18),
                              Text(
                                'Next Pray - 02:32',
                                style: IslamiStyles.bodySmall.copyWith(
                                  color: IslamiColors.black,
                                ),
                              ),
                              Image.asset('assets/images/mute_button.png'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text('Azkar', style: IslamiStyles.bodySmall),
              Row(
                spacing: 20,
                children: [
                  Container(
                    width: 190,
                    height: 260,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: IslamiColors.black,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: IslamiColors.gold, width: 2),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset('assets/images/image13.png'),
                        ),
                        Text(
                          'Evening Azkar',
                          style: IslamiStyles.body.copyWith(
                            color: IslamiColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 190,
                    height: 260,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: IslamiColors.black,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: IslamiColors.gold, width: 2),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset('assets/images/image8.png'),
                        ),
                        Text(
                          'Morning Azkar',
                          style: IslamiStyles.body.copyWith(
                            color: IslamiColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 20,
                children: [
                  Container(
                    width: 190,
                    height: 260,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: IslamiColors.black,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: IslamiColors.gold, width: 2),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset('assets/images/image13.png'),
                        ),
                        Text(
                          'Evening Azkar',
                          style: IslamiStyles.body.copyWith(
                            color: IslamiColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 190,
                    height: 260,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: IslamiColors.black,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: IslamiColors.gold, width: 2),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset('assets/images/image8.png'),
                        ),
                        Text(
                          'Morning Azkar',
                          style: IslamiStyles.body.copyWith(
                            color: IslamiColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
