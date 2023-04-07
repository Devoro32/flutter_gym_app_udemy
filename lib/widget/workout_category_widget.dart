// ignore_for_file: public_member_api_docs, sort_constructors_first
//76

import 'package:flutter/material.dart';

import 'package:gym_app/models/workout_category_model.dart';
import 'package:gym_app/screens/exercise_list_page.dart';

class WorkoutCategoryWidget extends StatelessWidget {
  final WorkoutCategoryModel workOutCategoryModel;
  const WorkoutCategoryWidget({
    Key? key,
    required this.workOutCategoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //75
        Column(
      children: [
        //78
        //add inkwell to this so when the user click on the card it can
        //navigate to a new screen
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              ExerciseListPage.routeName,
              arguments: workOutCategoryModel.categoryName,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              child: Stack(
                //with the stack, the location of each widget matters
                children: [
                  Image.network(
                    workOutCategoryModel.imageSource,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    //position the text to the bottom left rather than the top left
                    bottom: 0,
                    child: Container(
                      height: 40,
                      width: 400,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            workOutCategoryModel.categoryName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
