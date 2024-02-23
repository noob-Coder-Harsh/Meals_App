import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/fav_meals_provider.dart';

import '../models/meal.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({
    Key? key, // Change super.key to Key key
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favMeals = ref.watch(favMealsProvider);
    final isFav = favMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(title: Text(meal.title), actions: [
        IconButton(
          onPressed: () {
            final wasAdded =
                ref.read(favMealsProvider.notifier).toggleMealFavStatus(meal);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(wasAdded
                    ? 'added to Favourite'
                    : 'removed from Favourite')));
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: Tween<double>(begin: 0.8, end: 1).animate(animation),
                child: child,
              );
            },
            key: ValueKey(isFav),
            child: Icon(isFav ? Icons.star : Icons.star_border),
          ),
        )
      ]),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            for (final ingredients in meal.ingredients)
              Text(
                ingredients,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  step,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
