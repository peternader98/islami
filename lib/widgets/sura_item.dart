import 'package:flutter/material.dart';
import 'package:islami/core/islami_colors.dart';
import 'package:islami/core/islami_styles.dart';
import 'package:islami/models/sura_model.dart';

class SuraItem extends StatelessWidget {
  SuraItem({super.key, required this.suraModel});
  
  SuraModel suraModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(children: [Image.asset('assets/images/sura_number_frame.png'), Text('${suraModel.index +1}', style: IslamiStyles.body.copyWith(color: IslamiColors.white),)],),
      title: Text(suraModel.nameEn, style: IslamiStyles.body.copyWith(color: IslamiColors.white),),
      subtitle: Text('${suraModel.versesCount} Verses', style: IslamiStyles.body.copyWith(color: IslamiColors.white, fontSize: 14),),
      trailing: Text(suraModel.nameAr, style: IslamiStyles.title.copyWith(color: IslamiColors.white),),
    );
  }
}
