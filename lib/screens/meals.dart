import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_details.dart';
import 'package:mealapp/widgets/meal_item.dart';

class MealsScren extends StatelessWidget {
  const MealsScren({
    super.key,
    required this.title,
    required this.meals,
  });
  final String title;
  final List<Meal> meals;

  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('oh uh, nothing here'),
          SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting different category',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectMeal(meal, context);
          },
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
