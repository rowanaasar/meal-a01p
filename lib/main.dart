import 'package:flutter/material.dart';
import 'package:meal_app/screen/category_meal.dart';
import 'package:meal_app/screen/filter.dart';
import 'package:meal_app/screen/meal_details.dart';
import 'package:meal_app/screen/taps.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(    
        primarySwatch: Colors.red,
        accentColor: Colors.grey,
       canvasColor: Colors.white,//fixed color
      ),
      
      routes: {
        '/' :(context)=>Taps(),
        CategoryMeal.routeName:(context)=>CategoryMeal(),  
        MealDetails.routeName:(context)=>MealDetails(),    
        FilterScreen.routeName:(context)=>FilterScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: null, 
    );
  }
}
