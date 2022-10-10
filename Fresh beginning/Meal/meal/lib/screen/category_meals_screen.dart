import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final routeName = "/category-meals";

  final List<Meals> availableMeals;
  CategoryMealsScreen(this.availableMeals); 

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryId;
  late String categoryTitle;
   List<Meals>? displayMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = (ModalRoute.of(context) as dynamic).settings.arguments
          as Map<String, String>;
      categoryId = routeArgs['id'] as String;
      categoryTitle = routeArgs['title'] as String;
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId); 
      }).toList();
      _loadedInitData = true;
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals!.removeWhere((element) => element.id == mealId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(
              id: displayMeals![index].id,
              title: displayMeals![index].title,
              imageUrl: displayMeals![index].imageUrl,
              duration: displayMeals![index].duration,
              complexity: displayMeals![index].complexity,
              affordability: displayMeals![index].affordability,
              
            );
          }),
          itemCount: displayMeals!.length,
        ));
  }
}
