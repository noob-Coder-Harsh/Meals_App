import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
   const MainDrawer({super.key,required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ])),
              child: Row(
                children: [
                  Icon(
                    Icons.restaurant,
                    size: 40,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cooking Up!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
          ),
          ListTile(
            onTap: (){onSelectScreen('meals');},
            leading: Icon(Icons.fastfood,color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            title: Text('Meals',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold),),
          ),
          ListTile(
            onTap: (){onSelectScreen('filter');},
            leading: Icon(Icons.settings,color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            title: Text('Filters',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
