import 'package:flutter/material.dart';

class ExerciseListPage extends StatelessWidget {
  static const routeName = 'exerciseListPage';

  const ExerciseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      //this is to bring in the same theme from the material app
      appBar: AppBar(
        title: Text(args),
      ),
    );
  }
}
