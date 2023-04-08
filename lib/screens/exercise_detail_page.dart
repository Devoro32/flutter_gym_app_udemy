import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym_app/data/exercise.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/models/exercise_model.dart';
import 'package:collection/collection.dart';

class ExerciseDetailPage extends StatelessWidget {
  final Function(ExerciseModel) toggleFavourite;
  static String routeName = '/exerciseDetailPage';
  const ExerciseDetailPage({super.key, required this.toggleFavourite});

  @override
  Widget build(BuildContext context) {
    final exerciseModel =
        ModalRoute.of(context)!.settings.arguments as ExerciseModel;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavourite(exerciseModel);
        },
        backgroundColor: Colors.white,
        child: Icon(
          exerciseModel.isFavourite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20),
        child: ListView(
          children: [
            Image.network(
              (exerciseModel.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              exerciseModel.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            ...exerciseModel.steps
                .mapIndexed((index, e) => ListTile(
                      title: Text(e),
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                    ))
                .toList(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Targeted Muscle',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: exerciseModel.targetMuscles
                  .map(
                    (e) => Card(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Equipment',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: exerciseModel.equipment
                  .map(
                    (e) => Card(
                      color: Colors.purple,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.repeat,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(exerciseModel.sets)
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.fitness_center,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(exerciseModel.sets)
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.timer,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(exerciseModel.duration)
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
