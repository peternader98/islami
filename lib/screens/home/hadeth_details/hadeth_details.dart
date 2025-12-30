import 'package:flutter/material.dart';
import 'package:islami/core/islami_colors.dart';
import 'package:islami/core/islami_styles.dart';
import 'package:islami/models/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'HADETHDETAILS';

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel model =
        ModalRoute.of(context)?.settings.arguments as HadethModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: IslamiColors.black,
        iconTheme: IconThemeData(color: IslamiColors.gold),
        centerTitle: true,
        title: Text(model.title, style: IslamiStyles.title),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ListView.builder(
                    itemCount: model.content.length,
                    itemBuilder: (context, index) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          model.content[index],
                          style: IslamiStyles.body,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 110),
            ],
          ),
        ],
      ),
    );
  }
}
