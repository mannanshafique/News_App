import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.white,
            primaryColorLight: Colors.white
            // accentColor: Colors.amber,
            ),
        dark: ThemeData(
          brightness: Brightness.dark,
          // accentColor: Colors.amber,
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              home: HomePage("us"),
            ));
  }
}
