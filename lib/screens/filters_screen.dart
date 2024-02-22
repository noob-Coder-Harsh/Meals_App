import 'package:flutter/material.dart';
enum Filter{gluten,lactose,vegetarian,vegan}
class Filters extends StatefulWidget {
  const Filters({super.key, required this.currentFilter});
  final Map<Filter,bool> currentFilter;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFilter = false;
  var _lactoseFilter = false;
  var _vegetarianFilter = false;
  var _veganFilter = false;

  @override
  void initState() {
    super.initState();
    _glutenFilter = widget.currentFilter[Filter.gluten]!;
    _lactoseFilter = widget.currentFilter[Filter.lactose]!;
    _vegetarianFilter = widget.currentFilter[Filter.vegetarian]!;
    _veganFilter = widget.currentFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop){if(didPop) return;
          Navigator.of(context).pop({
            Filter.gluten : _glutenFilter,
            Filter.lactose : _lactoseFilter,
            Filter.vegetarian : _vegetarianFilter,
            Filter.vegan : _veganFilter,
          });

          },

        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFilter,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFilter = isChecked;
                });
              },
              title: Text('GlutenFree',style : Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer
              )),
              subtitle: Text('This meal is gluten free',style : Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),),),
              activeColor: Theme.of(context).colorScheme.primaryContainer,
              contentPadding: const EdgeInsets.symmetric(horizontal: 24,vertical: 6),
            ),
            SwitchListTile(
              value: _lactoseFilter,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFilter = isChecked;
                });
              },
              title: Text('LactoseFree',style : Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer
              )),
              subtitle: Text('This meal is lactose free',style : Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),),),
              activeColor: Theme.of(context).colorScheme.primaryContainer,
              contentPadding: const EdgeInsets.symmetric(horizontal: 24,vertical: 6),
            ),
            SwitchListTile(
              value: _vegetarianFilter,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilter = isChecked;
                });
              },
              title: Text('Vegetarian',style : Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer
              )),
              subtitle: Text('This meal is Vegetarian',style : Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),),),
              activeColor: Theme.of(context).colorScheme.primaryContainer,
              contentPadding: const EdgeInsets.symmetric(horizontal: 24,vertical: 6),
            ),
            SwitchListTile(
              value: _veganFilter,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilter = isChecked;
                });
              },
              title: Text('Vegan',style : Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer
              )),
              subtitle: Text('This meal is vegan',style : Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),),),
              activeColor: Theme.of(context).colorScheme.primaryContainer,
              contentPadding: const EdgeInsets.symmetric(horizontal: 24,vertical: 6),
            )
          ],
        ),
      ),
    );
  }
}
