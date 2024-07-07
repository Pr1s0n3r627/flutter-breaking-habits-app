import 'package:flutter/material.dart';
import 'screens/auth/splash_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Break the Cycle',
      theme: appTheme,
      home: SplashScreen(),
    );
  }
}
