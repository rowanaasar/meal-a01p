import 'package:flutter/material.dart';
import 'package:meal_app/screen/categories.dart';
import 'package:meal_app/screen/favouriteScreen.dart';
import 'package:meal_app/widget/main_drawer.dart';

class Taps extends StatefulWidget {
  @override
  _TapsState createState() => _TapsState();
}

class _TapsState extends State<Taps> {
  
  final List<Map<String, Object>> _pages = [
    {
      'page':CategoryScreen(),
      'title':'Category',
    },
    {
      'page':FavouriteScreen(),
      'title':'Favourite',
    }
  ];

  int _selectPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(  
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favourite"),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
