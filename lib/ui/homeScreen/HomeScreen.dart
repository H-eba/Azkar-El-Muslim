import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/ui/homeScreen/quran/QuranTab.dart';
import 'package:islami/ui/homeScreen/tasbeh/TasbehTab.dart';

import 'package:provider/provider.dart';

import '../../providers/SettingsProvider.dart';
import 'hadeth/HadethTab.dart';
import 'radio/RadioTab.dart';
import 'settings/SettingsTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getMainBackgroundImage()),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                  AppLocalizations.of(context)!.appTitle),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedTabIndex,
              onTap: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: ImageIcon(AssetImage('assets/images/ic_moshaf.png')),
                    label: AppLocalizations.of(context)!.quranTab),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                    label: AppLocalizations.of(context)!.hadethTab),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                    label: AppLocalizations.of(context)!.tasbehTab),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                    label: AppLocalizations.of(context)!.radioTab),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).primaryColor,
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settingTab),
              ],
            ),
            body: tabs[selectedTabIndex]));
  }

  var tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTab(), SettingsTab()];
}
