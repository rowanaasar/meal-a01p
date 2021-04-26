import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
//import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widget/meal_item.dart';

class CategoryMeal extends StatefulWidget {
  final String id;
  final String title;
  static const routeName = 'category_meal';

  const CategoryMeal({Key key, this.id, this.title}) : super(key: key);
  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  @override
  Widget build(BuildContext context) {
    // final routArg =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final categoryId = routArg['id'];
    // final categoryTitle = routArg['title'];

    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(widget.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeal[index].id,
            imageUrl: categoryMeal[index].imageUrl,
            title: categoryMeal[index].title,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
