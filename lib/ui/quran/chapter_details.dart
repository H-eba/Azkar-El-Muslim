import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChapterDetails extends StatefulWidget {
  static String routeName = 'chapter details';

  ChapterDetails({super.key});

  @override
  State<ChapterDetails> createState() => _ChapterDetailsState();
}

class _ChapterDetailsState extends State<ChapterDetails> {
  List<String>versesList=[];

  @override
  Widget build(BuildContext context) {
    ChapterDetailsScreenArgs args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsScreenArgs;
   if(versesList.isEmpty) {
    loadChapter(args.index);}
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/default_bg.png',
            ),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: versesList.isEmpty?
        Center(child: CircularProgressIndicator()):
       ListView.builder(itemBuilder: (context, index) {
         return Text(versesList[index],);

       },itemCount: versesList.length,)
      ),
    );
  }

  void loadChapter(index) async{
    String fileContent=  await rootBundle.loadString('assets/file/${index}.txt');
    List<String>lines=fileContent.trim().split('\n');
   print(lines);
     setState(() {
       versesList=lines;
     });
    //print(verses);
  }
}

class ChapterDetailsScreenArgs {
  String title;
  int index;
  ChapterDetailsScreenArgs(this.index, this.title);
}
