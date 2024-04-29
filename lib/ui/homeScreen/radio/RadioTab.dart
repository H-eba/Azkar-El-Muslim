import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/model/RadioResponse.dart';
import 'package:islami/ui/MyThemeData.dart';
import 'package:http/http.dart' as http;
import 'package:islami/ui/homeScreen/radio/radio_item.dart';


class RadioTab extends StatelessWidget {
  RadioTab({super.key});
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Expanded(flex: 3,
          child: Image.asset('assets/images/radio.png')),
       FutureBuilder(future: getRadio(),
           builder: (context, snapshot) {
             if(snapshot.hasError){
               return Center(child: Text('error'),);
             }
             if(snapshot.connectionState==ConnectionState.waiting){
               return Center(child: Text('error'),);
             }
             var radioResponse=snapshot.data as RadioResponse;
             List<Radios> radiosList=radioResponse.radios??[];
             return Expanded(
                 flex: 2,
                 child: ListView.builder(
               scrollDirection: Axis.horizontal,
                 physics: PageScrollPhysics(),
                 itemBuilder:  (context, index) => RadioItem(radio: radiosList[index],player: player,),));
           },)

      ],
    )
   ;
  }

  Future<RadioResponse>getRadio()async{
    var url=Uri.parse('https://mp3quran.net/api/v3/radios');
    var response=await http.get(url);
    var jason=jsonDecode(response.body);
    return RadioResponse.fromJson(jason);

  }

}
