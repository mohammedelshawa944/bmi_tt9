import 'package:bmi_tt9/constants.dart';
import 'package:bmi_tt9/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme:
            AppBarTheme(backgroundColor: backgroundColor, elevation: 0),
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Colors.pinkAccent, secondary: Colors.pinkAccent),
      ),
      home: InputPage(),
    );
  }
}
