import 'package:flutter/material.dart';
import 'package:islami/ui/home_screen.dart';
class SplashScreen extends StatelessWidget {
  static String routeName='splash screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: Image.asset('assets/images/splash – 1.png',
        fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,),
    );
  }
}
