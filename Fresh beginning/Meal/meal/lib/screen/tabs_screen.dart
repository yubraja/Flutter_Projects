import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import 'categories_screen.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meals> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
 late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages= [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Your Favorite'}
    ];
    // TODO: implement initState
    super.initState();
  }
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Category",
                backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Favorites",
                backgroundColor: Theme.of(context).primaryColor)
          ]),
    );
  }
}
