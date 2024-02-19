import 'package:flutter/material.dart';
import 'package:islami/ui/home_screen.dart';
import 'package:islami/ui/quran/chapter_details.dart';
import 'package:islami/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Color(0xFFB7935F),
                  showUnselectedLabels: true,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              selectedIconTheme: IconThemeData(size: 35),
              unselectedIconTheme: IconThemeData(size: 30)),

          appBarTheme: AppBarTheme(
              color: Colors.transparent,
              titleTextStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              centerTitle: true),
          scaffoldBackgroundColor: Colors.transparent,
           colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFFB7935F),
          ),
          useMaterial3: true,
          primaryColor:Color(0xFFB7935F),
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (_) => SplashScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          ChapterDetails.routeName:(_)=>ChapterDetails(),
        });
  }
}
