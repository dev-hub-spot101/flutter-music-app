import 'package:flutter/material.dart';
import 'package:music_app/screens/home.dart';
import 'package:get/get.dart';
import 'package:music_app/screens/playlist.dart';
import 'package:music_app/screens/songs.dart';

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
      title: 'Music App | Devhubspot',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        )
      ),
      home: const HomeScreen(),
    );
  }
}