import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/SettingsProvider.dart';
import '../homeScreen/HomeScreen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "Splash";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        provider.getSplashBackground(),
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
