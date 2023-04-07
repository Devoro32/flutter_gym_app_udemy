import 'package:flutter/material.dart';
import 'package:gym_app/data/workout_category_list.dart';
import 'package:gym_app/widget/workout_category_widget.dart';

class HomePage extends StatelessWidget {
  //79
  static String routeName = '/HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          //replaced by the appbartheme in the main page
          //backgroundColor: const Color(0xff322751),
          title: const Text(
            'Gym Guide App',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            //73
            Padding(
              padding: EdgeInsets.only(
                right: 8.0,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_image.jpg'),
              ),
            ),
            //Image.asset('assets/images/user_image.jpg'),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Workout Categories',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              //to be able to use a widget in a string, need to use '...' in front of the  widget
              // ...workoutCategoryList
              //     .map(
              //       (e) => WorkoutCategoryWidget(workOutCategoryModel: e),
              //     )
              //     .toList(),
              //76
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: workoutCategoryList.length,
                  itemBuilder: ((context, index) => WorkoutCategoryWidget(
                        workOutCategoryModel: workoutCategoryList[index],
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
