import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart/';

import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/provider/meals_provider.dart';
import 'package:meals_app/provider/fav_meals_provider.dart';

const kInitialFilter = {
  Filter.gluten: false,
  Filter.lactose: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  Future<void> _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filter') {
      final result = await Navigator.push<Map<Filter, bool>>(
          context, MaterialPageRoute(builder: (context) => Filters(currentFilter: _selectedFilters,)));
      setState(() {
        _selectedFilters = result ?? kInitialFilter;
      });
    }
  }

  var _selectPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }


  Map<Filter, bool> _selectedFilters = kInitialFilter;

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((element) {
      if (_selectedFilters[Filter.gluten]! && !element.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactose]! && !element.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !element.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !element.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,);
    String activePageTitle = 'Categories';
    if (_selectPageIndex == 1) {
      final favMeals = ref.watch(favMealsProvider);
      activePage = MealsScreen(
        meals: favMeals,
      );
      activePageTitle = 'your Favourite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white12,
        currentIndex: _selectPageIndex,
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                size: 32,
                color: Colors.white,
              ),
              label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 32,
                color: Colors.white,
              ),
              label: 'Favourites')
        ],
      ),
    );
  }
}
