import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/SettingsProvider.dart';
import 'package:islami/ui/MyThemeData.dart';
import 'package:islami/ui/chapterDetails/ChapterDetailsScreen.dart';
import 'package:islami/ui/headethDetails/HadethDetails.dart';
import 'package:islami/ui/homeScreen/HomeScreen.dart';
import 'package:islami/ui/splash/SplashScreen.dart';
import 'package:provider/provider.dart';
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  var provider=SettingsProvider();
  await provider.loadSetting();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => provider,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.light,
      darkTheme: MyThemeData.dark,
      themeMode: settingsProvider.selectedTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen()
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.selectedLocale),
    );
  }
}

