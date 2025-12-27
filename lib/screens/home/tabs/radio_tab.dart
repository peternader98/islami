import 'package:flutter/material.dart';
import 'package:islami/core/islami_colors.dart';
import 'package:islami/core/islami_styles.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  List<Container> radios = [];
  List<Container> reciters = [];

  bool isRadio = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadContainers(isRadio);
    loadContainers(!isRadio);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/radio_bg.png'),
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 180),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: isRadio
                        ? ElevatedButton.styleFrom(
                            backgroundColor: IslamiColors.gold,
                            foregroundColor: IslamiColors.black,
                            textStyle: IslamiStyles.bodySmall.copyWith(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          )
                        : ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: IslamiColors.white,
                            textStyle: IslamiStyles.bodySmall.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                    onPressed: () {
                      setState(() {
                        isRadio = true;
                      });
                    },
                    child: Text('Radio'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: !isRadio
                        ? ElevatedButton.styleFrom(
                            backgroundColor: IslamiColors.gold,
                            foregroundColor: IslamiColors.black,
                            textStyle: IslamiStyles.bodySmall.copyWith(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          )
                        : ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: IslamiColors.white,
                            textStyle: IslamiStyles.bodySmall.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                    onPressed: () {
                      setState(() {
                        isRadio = false;
                      });
                    },
                    child: Text('Reciters'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: isRadio ? ListView.separated(
                itemCount: radios.length,
                itemBuilder: (context, index) {
                  return radios[index];
                },
                separatorBuilder: (context, index) => SizedBox(height: 16),
              ) : ListView.separated(
                itemCount: reciters.length,
                itemBuilder: (context, index) {
                  return reciters[index];
                },
                separatorBuilder: (context, index) => SizedBox(height: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loadContainers(bool isRadio) {
    if (isRadio) {
      for (int i = 0; i < 10; i++) {
        radios.add(
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              color: IslamiColors.gold,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                i == 2
                    ? Positioned(
                  height: 100,
                  top: 70,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset('assets/images/sound_wave.png'),
                  ),
                )
                    : Image.asset('assets/images/sound_bg.png'),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Radio Ibrahim Al-Akdar',
                        style: IslamiStyles.body.copyWith(
                          color: IslamiColors.black,
                        ),
                      ),
                      Spacer(),
                      Row(
                        spacing: 20,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30, width: 30),
                          i == 2
                              ? Image.asset('assets/images/pause_button.png')
                              : Image.asset('assets/images/play_button.png'),
                          i == 2
                              ? Image.asset('assets/images/mute_button.png')
                              : Image.asset('assets/images/volume_button.png'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
    else {
      for (int i = 0; i < 10; i++) {
        reciters.add(
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              color: IslamiColors.gold,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                i == 2
                    ? Positioned(
                  height: 100,
                  top: 70,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset('assets/images/sound_wave.png'),
                  ),
                )
                    : Image.asset('assets/images/sound_bg.png'),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Ibrahim Al-Akdar',
                        style: IslamiStyles.body.copyWith(
                          color: IslamiColors.black,
                        ),
                      ),
                      Spacer(),
                      Row(
                        spacing: 20,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30, width: 30),
                          i == 2
                              ? Image.asset('assets/images/pause_button.png')
                              : Image.asset('assets/images/play_button.png'),
                          i == 2
                              ? Image.asset('assets/images/mute_button.png')
                              : Image.asset('assets/images/volume_button.png'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
  }
}
