import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/islami_colors.dart';
import 'package:islami/core/islami_styles.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({super.key});

  static const String routeName = 'SURA_DETAILS';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> versesLines = [];
  String verses = '';

  @override
  Widget build(BuildContext context) {
    SuraModel model = ModalRoute.of(context)!.settings.arguments as SuraModel;

    if (versesLines.isEmpty) loadSuraFile(model.index);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: IslamiColors.black,
        iconTheme: IconThemeData(color: IslamiColors.gold),
        centerTitle: true,
        title: Text(model.nameEn, style: IslamiStyles.title),
      ),
      backgroundColor: IslamiColors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sura_details_bg.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 100),
              Text(model.nameAr, style: IslamiStyles.body),
              SizedBox(height: 25),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          verses,
                          style: IslamiStyles.body,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 110,)
            ],
          ),
        ],
      ),
    );
  }

  loadSuraFile(int index) async {
    String suraFile = await rootBundle.loadString(
      'assets/files/${index + 1}.txt',
    );
    versesLines = suraFile.split('\n');
    for(int i = 0; i < versesLines.length; i++){
      verses = verses + ' [${i + 1}] ' + versesLines[i];
    }
    setState(() {});
  }
}
