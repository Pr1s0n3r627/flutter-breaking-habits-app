import 'package:flutter/material.dart';
import '../widgets/credits_page.dart';

class CreditsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credits'),
      ),
      body: CreditsPage(),
    );
  }
}
