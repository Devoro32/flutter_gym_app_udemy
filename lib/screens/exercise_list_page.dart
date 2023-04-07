import 'package:flutter/material.dart';
import 'package:gym_app/data/exercise.dart';
import 'package:gym_app/models/exercise_model.dart';

class ExerciseListPage extends StatelessWidget {
  static const routeName = 'exerciseListPage';

  const ExerciseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    final ExerciseModel exerciseModel = exerciseList[0];
    return Scaffold(
      //this is to bring in the same theme from the material app
      appBar: AppBar(
        title: Text(args),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
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
                child: Image.network(exerciseModel.imageUrl),
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
      ),
    );
  }
}
