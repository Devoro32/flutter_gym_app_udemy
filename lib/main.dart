import 'package:flutter/material.dart';
import 'package:gym_app/screens/exercise_detail_page.dart';
import 'package:gym_app/screens/exercise_list_page.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym App',
      //set the theme globally
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff322751),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff322751),
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ExerciseListPage.routeName: (context) => const ExerciseListPage(),
        ExerciseDetailPage.routeName: (context) => const ExerciseDetailPage(),
      },
      //79
      // home: const HomePage(),
    );
  }
}
