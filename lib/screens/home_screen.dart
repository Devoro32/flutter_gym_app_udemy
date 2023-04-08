import 'package:flutter/material.dart';
import 'package:gym_app/data/exercise.dart';
import 'package:gym_app/data/workout_category_list.dart';
import 'package:gym_app/screens/bmi_calculator.dart';
import 'package:gym_app/screens/filter_page.dart';
import 'package:gym_app/widget/exercise_card_widget.dart';
import 'package:gym_app/widget/workout_category_widget.dart';

class HomePage extends StatefulWidget {
  //79
  static String routeName = '/HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: const Color(0xff322751),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 50),
                  child: Text(
                    'GYMGUIDE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text('BMI Calculator'),
                onTap: () {
                  Navigator.of(context).pushNamed(BMICalculatorPage.routeName);
                },
              ),
              const Divider(color: Colors.grey),
              ListTile(
                title: const Text('Filter'),
                onTap: () {
                  Navigator.of(context).pushNamed(FilterPage.routeName);
                },
              ),
            ],
          ),
        ),
        //86
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              _index = value;
              setState(() {});
            },
            currentIndex: _index,
            items: const [
              BottomNavigationBarItem(
                label: 'Category',
                icon: Icon(Icons.category),
              ),
              BottomNavigationBarItem(
                label: 'Favourite',
                icon: Icon(Icons.favorite),
              ),
            ]),
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
              Text(
                _index == 0 ? 'Workout Categories' : 'Favourite',
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              _index == 0
                  ? Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: workoutCategoryList.length,
                        itemBuilder: ((context, index) => WorkoutCategoryWidget(
                              workOutCategoryModel: workoutCategoryList[index],
                            )),
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemBuilder: (context, index) => ExerciseCardWidget(
                          exerciseModel: exerciseList
                              .where((element) => element.isFavourite)
                              .toList()[index],
                        ),
                        itemCount: exerciseList
                            .where((element) => element.isFavourite)
                            .toList()
                            .length,
                      ),
                    )
            ],
          ),
        ));
  }
}
