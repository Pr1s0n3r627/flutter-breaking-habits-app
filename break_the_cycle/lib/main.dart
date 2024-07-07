import 'package:flutter/material.dart';
import 'routes.dart';
import 'utils/theme.dart'; // Import your theme

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Break the Cycle',
      theme: lightTheme, // Use your defined theme here
      darkTheme: darkTheme,
      initialRoute: '/', // Initial route of the app
      onGenerateRoute: Routes.generateRoute, // Define route generation logic
    );
  }
}
