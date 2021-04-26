import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/meal_details.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final int duration;
  final String title;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key key,
      this.imageUrl,
      this.duration,
      this.title,
      this.complexity,
      this.affordability,
       this.id
       });

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'unknown';
    }
  }

  // ignore: missing_return
  String get complextyText {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
        break;
      case Complexity.Challenging:
        break;
      case Complexity.Hard:
        break;
      default:
        return 'unknown';
    }
  }

  seclectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetails.routeName,
    arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: seclectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(imageUrl),
              ),
              Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )))
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$complextyText"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.alarm),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$affordabilityText "),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
