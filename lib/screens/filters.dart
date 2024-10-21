import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key, required Map<Filter, bool> currentFilters});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _gluterFree = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilter = false;
  var _veganFilter = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _gluterFree = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegetarianFilter = activeFilters[Filter.vegetarian]!;
    _veganFilter = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      // drawer: MainDrawer(
      //   onselectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (ctx) => TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _gluterFree,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilter,
            Filter.vegan: _veganFilter,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluterFree,
              onChanged: (isChecked) {
                setState(() {
                  _gluterFree = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
              subtitle: const Text(
                'Only include gluter-free meals',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Gluter free',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
              subtitle: const Text(
                'Only include lactose-free meals',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Lactose-free',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SwitchListTile(
              value: _vegetarianFilter,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilter = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
              subtitle: const Text(
                'Only include vegetarian meals',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Vegetarian',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SwitchListTile(
              value: _veganFilter,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilter = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
              subtitle: const Text(
                'Only include vegan meals',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'vegan',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
