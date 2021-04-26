import 'package:flutter/material.dart';
import 'package:meal_app/screen/category_meal.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({Key key, this.id, this.title, this.color});

  void selectCategory(BuildContext context) {
    // Navigator.of(context).pushNamed(
    //   CategoryMeal.routeName,
    //   arguments: {
    //     'id':id,
    //     'title':title
    //   }
    //   );
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => CategoryMeal(id:id,title:title)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.orange,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(.5),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
