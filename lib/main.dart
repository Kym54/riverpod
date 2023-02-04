
//import 'package:energy/HomePage.dart';
import 'package:energy/Example4/steam_homepage.dart';
// import 'package:energy/Weather/weather_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main(){
  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const StreamHomePage(),
    );
  }
}
