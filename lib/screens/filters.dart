import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluterFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      body: Column(
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
          )
        ],
      ),
    );
  }
}
