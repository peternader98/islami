import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/models/hadeth_model.dart';
import 'package:islami/screens/home/hadeth_details/hadeth_details.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hadith_bg.png'),
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: double.infinity,
          enlargeCenterPage: true,
          viewportFraction: 0.7,
        ),
        items: allAhadeth.map((item) {
          return Column(
            children: [
              SizedBox(height: 180),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HadethDetails.routeName,
                      arguments: item,
                    );
                  },
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset('assets/images/hadith_card_bg.png'),
                      Column(
                        children: [
                          SizedBox(height: 24),
                          Text(item.title),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
                              child: ListView.builder(
                                itemCount: item.content.length,
                                itemBuilder: (context, index) {
                                  return Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(item.content[index]),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 72,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  loadHadethFile() async {
    for (int i = 0; i < 50; i++) {
      String hadethFile = await rootBundle.loadString(
        'assets/files/h${i + 1}.txt',
      );
      List<String> hadethLines = hadethFile.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      allAhadeth.add(HadethModel(title: title, content: content));
    }
    setState(() {});
  }
}
