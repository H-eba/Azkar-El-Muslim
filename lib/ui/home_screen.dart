import 'package:flutter/material.dart';
import 'package:islami/ui/hadeth_tab.dart';
import 'package:islami/ui/myThemeData.dart';
import 'package:islami/ui/quran/quran_tab.dart';
import 'package:islami/ui/radio_tab.dart';
import 'package:islami/ui/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage(MyTemeData.getMainBackGround()
              //  MyTemeData.isDarkEnabled?
               // 'assets/images/dark_bg.png':
                //'assets/images/default_bg.png',
              ),
              fit: BoxFit.fill,
            )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(AppLocalizations.of(context)!.appTitle),
            ),
          ),
          bottomNavigationBar:
          BottomNavigationBar(
            currentIndex: selectedTabIndex,
              onTap: (index){
              selectedTabIndex=index;
              setState(() {

              });
              },
              items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                label: 'quran'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                label: 'hadeth'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                label: 'sebha'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                label: 'radio'),
          ]),
          body: tabs[selectedTabIndex],
        ));
  }
}
var tabs=[
  QuranTab(),
  HadethTab(),
  SebhaTab(),
  RadioTab()
];
