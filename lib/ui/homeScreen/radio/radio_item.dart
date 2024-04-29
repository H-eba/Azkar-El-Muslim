import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/RadioResponse.dart';
import '../../MyThemeData.dart';

class RadioItem extends StatelessWidget {
  Radios radio;
  AudioPlayer player;
   RadioItem({required this.radio,required this.player,super.key});
   bool isTabed=false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
       // Text('اذاعة القران الكريم',style: TextStyle(fontSize: 35),),
          Text(radio.name??'',style: TextStyle(fontSize: 30),),
        Row(  mainAxisAlignment: MainAxisAlignment.center,
          children: [

            IconButton(onPressed: () {

            }, icon: Icon(Icons.skip_previous,size: 70,
                color:Theme.of(context).iconTheme.color)
            ),
            IconButton(
                onPressed: () async{
                isTabed?
                    await player.pause()
                    :
              await player.play(UrlSource(radio.url??''));
                isTabed=!isTabed;
              //await player.play((radio.url ??'') as Source);

            }, icon: Icon(Icons.play_arrow,size: 70,
              color:Theme.of(context).iconTheme.color
            )),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.skip_next,size: 70,
                color:Theme.of(context).iconTheme.color)
            )

          ],)
      ],),
    );
  }
}
