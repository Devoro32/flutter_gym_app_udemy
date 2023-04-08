import 'package:flutter/material.dart';
import 'package:gym_app/data/exercise.dart';
import 'package:gym_app/models/exercise_model.dart';
import 'package:gym_app/screens/bmi_calculator.dart';
import 'package:gym_app/screens/exercise_detail_page.dart';
import 'package:gym_app/screens/exercise_list_page.dart';
import 'package:gym_app/screens/filter_page.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _toggleIsFavourite(ExerciseModel exerciseModel) {
    ExerciseModel model = exerciseList
        .firstWhere((element) => element.name == exerciseModel.name);
    //update the model with the opposite value

    setState(() {
      model.isFavourite = !model.isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym App',
      //set the theme globally
      //! video 88, unselecting a favourite exercise is not working,
      //!it should automatically be removed from the favourite list, but it is not
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
        HomePage.routeName: (context) => HomePage(),
        ExerciseListPage.routeName: (context) => const ExerciseListPage(),
        BMICalculatorPage.routeName: (context) => const BMICalculatorPage(),
        FilterPage.routeName: (context) => const FilterPage(),
        ExerciseDetailPage.routeName: (context) => ExerciseDetailPage(
              toggleFavourite: _toggleIsFavourite,
            ),
      },
      //79
      // home: const HomePage(),
    );
  }
}
