import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluterFree = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilter = false;
  var _veganFilter = false;

  @override
  void initState() {
    super.initState();
    _gluterFree = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilter = widget.currentFilters[Filter.vegetarian]!;
    _veganFilter = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
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
              contentPadding: EdgeInsets.only(
                left: 34,
                right: 22,
              ),
              subtitle: Text(
                'Only include gluter-free meals',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              title: Text(
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
              contentPadding: EdgeInsets.only(
                left: 34,
                right: 22,
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              title: Text(
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
              contentPadding: EdgeInsets.only(
                left: 34,
                right: 22,
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              title: Text(
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
              contentPadding: EdgeInsets.only(
                left: 34,
                right: 22,
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              title: Text(
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
