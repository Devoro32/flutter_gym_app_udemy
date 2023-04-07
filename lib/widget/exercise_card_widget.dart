import 'package:flutter/material.dart';
import 'package:gym_app/models/exercise_model.dart';

class ExerciseCardWidget extends StatelessWidget {
  final ExerciseModel exerciseModel;
  const ExerciseCardWidget({super.key, required this.exerciseModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 240,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 4,
              color: Colors.grey.withOpacity(0.1),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          //move the texts to the left
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
              child: Image.network(
                exerciseModel.imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    exerciseModel.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //create the rating out of 5 star
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Icon(
                          index + 1 <= exerciseModel.difficulty
                              ? Icons.star
                              : Icons.star_outline,
                          size: 15,
                          color: Colors.orange,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            //user .join because the name would requlst as Equipment: [Lat Pulldown machine]
            //rather than Equipment: Lat Pulldown machine
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Equipment: ${exerciseModel.equipment.join(',')}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}