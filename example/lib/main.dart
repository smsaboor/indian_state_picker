import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state.dart';
import 'package:indian_state_picker/indian_state_picker.dart';
import 'package:indian_state_picker/state_picker_dialog.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Pickers Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IndianState _selectedDialogCountry =
  IndianStatePickerUtils.getStateByCapital('Lucknow');

  IndianState _selectedFilteredDialogCountry =
  IndianStatePickerUtils.getStateByCapital('Lucknow');

  IndianState _selectedCupertinoCountry =
  IndianStatePickerUtils.getStateByCode('UP');

  IndianState _selectedFilteredCupertinoCountry =
  IndianStatePickerUtils.getStateByCode('MH');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndianState Pickers Demo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('CountryPickerDropdown (selectedItemBuilder)'),
                _buildCountryPickerDropdown(hasSelectedItemBuilder: true),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('CountryPickerDropdown (filtered)'),
                ListTile(title: _buildCountryPickerDropdown(filtered: true)),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('CountryPickerDropdown (sorted by isoCode)'),
                ListTile(
                    title: _buildCountryPickerDropdown(sortedByCode: true)),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                    "CountryPickerDropdown (has priorityList['GB,'CN'])"),
                ListTile(
                    title: _buildCountryPickerDropdown(hasPriorityList: true)),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("CountryPickerDialog (has priorityList['TR,'US'])"),
                ListTile(
                  onTap: _openCountryPickerDialog,
                  title: _buildDialogItem(_selectedDialogCountry),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('CountryPickerDialog (filtered)'),
                ListTile(
                  onTap: _openFilteredCountryPickerDialog,
                  title: _buildDialogItem(_selectedFilteredDialogCountry),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  _buildCountryPickerDropdown(
      {bool filtered = false,
        bool sortedByCode = false,
        bool hasPriorityList = false,
        bool hasSelectedItemBuilder = false}) {
    double dropdownButtonWidth = MediaQuery.of(context).size.width * 0.8;
    double dropdownItemWidth = dropdownButtonWidth - 30;
    double dropdownSelectedItemWidth = dropdownButtonWidth - 30;
    return Row(
      children: <Widget>[
        SizedBox(
          width: dropdownButtonWidth,
          child: IndianStatePickerDropdown(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            itemHeight: null,
            isDense: false,
            selectedItemBuilder: hasSelectedItemBuilder == true
                ? (IndianState indianState) => _buildDropdownSelectedItemBuilder(
                indianState, dropdownSelectedItemWidth)
                : null,
            itemBuilder: (IndianState indianState) => hasSelectedItemBuilder == true
                ? _buildDropdownItemWithLongText(indianState, dropdownItemWidth)
                : _buildDropdownItem(indianState, dropdownItemWidth),
            initialValue: 'UP',
            itemFilter: filtered
                ? (c) => ['UP', 'AP', 'AS', 'MH'].contains(c.code)
                : null,
            //priorityList is shown at the beginning of list
            priorityList: hasPriorityList
                ? [
              IndianStatePickerUtils.getStateByCode('UP'),
              IndianStatePickerUtils.getStateByCode('MH'),
            ]
                : null,
            sortComparator: sortedByCode
                ? (IndianState a, IndianState b) => a.code.compareTo(b.code)
                : null,
            onValuePicked: (IndianState indianState) {
              debugPrint(indianState.name);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownItem(IndianState indianState, double dropdownItemWidth) =>
      SizedBox(
        width: dropdownItemWidth,
        child: Row(
          children: <Widget>[
            IndianStatePickerUtils.getStateImage(indianState, 50, 50),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(child: Text("+${indianState.population}(${indianState.code})")),
          ],
        ),
      );

  Widget _buildDropdownItemWithLongText(
      IndianState indianState, double dropdownItemWidth) =>
      SizedBox(
        width: dropdownItemWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              IndianStatePickerUtils.getStateImage(indianState, 50,50),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(child: Text(indianState.name)),
            ],
          ),
        ),
      );

  Widget _buildDropdownSelectedItemBuilder(
      IndianState indianState, double dropdownItemWidth) =>
      SizedBox(
          width: dropdownItemWidth,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  IndianStatePickerUtils.getStateImage(indianState,50,50),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                      child: Text(
                        indianState.name,
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )),
                ],
              )));

  Widget _buildDialogItem(IndianState indianState) => Row(
    children: <Widget>[
      IndianStatePickerUtils.getStateImage(indianState, 50, 50),
      // const SizedBox(width: 8.0),
      // Text("+${indianState.population}"),
      const SizedBox(width: 8.0),
      Flexible(child: Text(indianState.name))
    ],
  );

  void _openCountryPickerDialog() => showDialog(
    context: context,
    builder: (context) => Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.pink),
      child: IndianStatePickerDialog(
        titlePadding: const EdgeInsets.all(8.0),
        searchCursorColor: Colors.pinkAccent,
        searchInputDecoration: const InputDecoration(hintText: 'Search...'),
        isSearchable: true,
        title: const Text('Select your phone code'),
        onValuePicked: (IndianState indianState) =>
            setState(() => _selectedDialogCountry = indianState),
        itemBuilder: _buildDialogItem,
        priorityList: [
          IndianStatePickerUtils.getStateByCode('UP'),
          IndianStatePickerUtils.getStateByCode('MH'),
        ],
      ),
    ),
  );

  void _openFilteredCountryPickerDialog() => showDialog(
    context: context,
    builder: (context) => Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.pink),
        child: IndianStatePickerDialog(
            titlePadding: const EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration:
            const InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: const Text('Select your phone code'),
            onValuePicked: (IndianState indianState) =>
                setState(() => _selectedFilteredDialogCountry = indianState),
            itemFilter: (c) => ['UP', 'AP', 'AS', 'MH'].contains(c.code),
            itemBuilder: _buildDialogItem)),
  );
}