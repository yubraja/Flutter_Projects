import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> _currentFilter;

  final Function saveFilters;
  FilterScreen(this._currentFilter, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget._currentFilter['gluten'] as bool;
    _vegan = widget._currentFilter['vegan'] as bool;
    _vegetarian = widget._currentFilter['vegetarian'] as bool;
    _lactoseFree = widget._currentFilter['lactose'] as bool;

    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: (value) {
          updateValue(value);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };

                  widget.saveFilters(selectedFilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust your meal selection",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile("Glueten_Free",
                    "Only include gluten-free meals.", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Lactose_Free",
                    "Only include Lactose-free meals.",
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan", "Only include Vegan meals.", _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian", "Only include Vegetarian meals.", _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian ? _vegetarian = false : _vegetarian = true;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
