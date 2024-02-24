import 'package:flutter/material.dart';
import 'package:islami/ui/quran/chapter_details.dart';

class TitleWidget extends StatelessWidget {
  String title;
   int chapterIndex;
  TitleWidget(this.title,this.chapterIndex);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,ChapterDetails.routeName,
            arguments:ChapterDetailsScreenArgs(chapterIndex, title) );
        
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(title,style:Theme.of(context).textTheme.titleLarge,),
      ),
    );
  }
}
