import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = 'meal_details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) =>meal.id==mealId);

    return Scaffold(
      appBar: AppBar(     
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
            ),
            Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text("Intgredients",style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold)),
          ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context,index)=>Card(
                  color: Theme.of(context).accentColor,
                  child:Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                )),
                itemCount: selectedMeal.ingredients.length,
              ),
             ),
            Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text("Steps",style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold)),
          ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 250,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context,index)=>Card(
                  color: Theme.of(context).accentColor,
                  child:Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Text(selectedMeal.steps[index]),
                )),
                itemCount: selectedMeal.steps.length,
              ),
),
        ],),
      ),
    );
  }
}
