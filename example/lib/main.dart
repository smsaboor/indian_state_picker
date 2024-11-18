import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Pickers Demo',
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
  final helper = StatePickerHelper<IndianState>(
    states: indianStateList,
    getCode: (state) => state.code,
    getName: (state) => state.name,
    getCapital: (state) => state.capital,
    getImagePath: (state) => state.image,
  );

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
            children: [
              const Text("StatePickerDropdown"),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: StatePickerDropdown<IndianState>(
                  states: indianStateList,
                  initialValue: helper.findStateByCode("UP"),
                  onValuePicked: (state) {
                    print('Picked: ${state.name}');
                  },
                  itemBuilder: (state) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            helper.getImage(
                                imagePath: state.image,
                                height: 120,
                                width: 80,
                                fit: BoxFit.fill), // State flag
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                state.name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  sortComparator: (a, b) =>
                      a.name.compareTo(b.name), // Sort by name
                ),
              ),
            ],
          )),
          const SizedBox(height: 20),
          Card(
              child: Column(
            children: [
              const Text("StatePickerDropdown with top States"),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: StatePickerDropdown<IndianState>(
                  states: indianStateList,
                  topStates: [helper.findStateByCapital('lucknow')],
                  isEqual: (state, topState) => state.code == topState.code,
                  onValuePicked: (state) {
                    print('Picked: ${state.name}');
                  },
                  itemBuilder: (state) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            helper.getImage(
                                imagePath: state.image,
                                height: 120,
                                width: 80,
                                fit: BoxFit.fill), // State flag
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                state.name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  sortComparator: (a, b) =>
                      a.name.compareTo(b.name), // Sort by name
                ),
              ),
            ],
          )),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: StatePickerDropdown<IndianState>(
              states: indianStateList,
              topStates: [
                helper.findStateByCode('MP'),
                helper.findStateByCapital('Lucknow')
              ],
              isEqual: (state, topState) => state.code == topState.code,
              onValuePicked: (state) {
                print('Picked: ${state.name}');
              },
              itemBuilder: (state) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        helper.getImage(
                            imagePath: state.image,
                            height: 120,
                            width: 80,
                            fit: BoxFit.fill),
                        // State flag
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            state.name,
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              sortComparator: (a, b) =>
                  a.name.compareTo(b.name), // Sort by name
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: StatePickerDropdown<IndianState>(
              states: indianStateList,
              topStates: [
                helper.findStateByCapital('lucknow'),
                indianStateList[11]
              ],
              isEqual: (IndianState item, IndianState priorityItem) =>
                  item.code == priorityItem.code,
              onValuePicked: (state) => print('Picked: ${state.name}'),
              // itemFilter: (state) => state.population > 1000000,
              // itemBuilder: (state) => _buildDropdownItem(state, 300),
              itemBuilder: (indianState) {
                return SizedBox(
                    width: 300,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: <Widget>[
                            helper.getImage(
                                imagePath: indianState.image,
                                height: 120,
                                width: 80,
                                fit: BoxFit.fill),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                                child: Text(
                              indianState.name,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )),
                          ],
                        )));
              },
              sortComparator: (a, b) => a.name.compareTo(b.name),
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Dialog with search state by name"),
                ListTile(
                  onTap: () {
                    _openCountryPickerDialog(
                        isSearchable: true,
                        searchOn: "name",
                        states: indianStateList,
                        topStates: []);
                  },
                  title: Row(
                    children: <Widget>[
                      helper.getImage(
                          imagePath: helper.findStateByCode('mp').image,
                          height: 120,
                          width: 80,
                          fit: BoxFit.fill),
                      // const SizedBox(width: 8.0),
                      // Text("+${indianState.population}"),
                      const SizedBox(width: 8.0),
                      Flexible(child: Text(helper.findStateByCode('mp').name))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Dialog with search state by capital"),
                ListTile(
                  onTap: () {
                    _openCountryPickerDialog(
                        isSearchable: true,
                        searchOn: "capital",
                        states: indianStateList,
                        topStates: []);
                  },
                  title: Row(
                    children: <Widget>[
                      helper.getImage(
                          imagePath: helper.findStateByCode('mp').image,
                          height: 120,
                          width: 80,
                          fit: BoxFit.fill),
                      // const SizedBox(width: 8.0),
                      // Text("+${indianState.population}"),
                      const SizedBox(width: 8.0),
                      Flexible(child: Text(helper.findStateByCode('mp').name))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Dialog without search bar"),
                ListTile(
                  onTap: () {
                    _openCountryPickerDialog(
                        isSearchable: false,
                        searchOn: "name",
                        states: indianStateList,
                        topStates: []);
                  },
                  title: Row(
                    children: <Widget>[
                      helper.getImage(
                          imagePath: helper.findStateByCode('mp').image,
                          height: 120,
                          width: 80,
                          fit: BoxFit.fill),
                      // const SizedBox(width: 8.0),
                      // Text("+${indianState.population}"),
                      const SizedBox(width: 8.0),
                      Flexible(child: Text(helper.findStateByCode('mp').name))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Dialog with top States"),
                ListTile(
                  onTap: () {
                    _openCountryPickerDialog(
                        isSearchable: false,
                        searchOn: "",
                        states: indianStateList,
                        topStates:  [
                          helper.findStateByCode('UP'),
                          helper.findStateByCode('MH'),
                        ],
                    );
                  },
                  title: Row(
                    children: <Widget>[
                      helper.getImage(
                          imagePath: helper.findStateByCode('mp').image,
                          height: 120,
                          width: 80,
                          fit: BoxFit.fill),
                      // const SizedBox(width: 8.0),
                      // Text("+${indianState.population}"),
                      const SizedBox(width: 8.0),
                      Flexible(child: Text(helper.findStateByCode('mp').name))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openCountryPickerDialog(
          {required List<IndianState> states,
          required bool isSearchable,
          required List<IndianState> topStates,
          required String searchOn}) =>
      showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: StatePickerDialog<IndianState>(
            states: states,
            topStates: topStates,
            titlePadding: const EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: const InputDecoration(hintText: 'Search...'),
            isSearchable: isSearchable,
            title: const Text('Select your phone code'),
            searchFilter: (item, query) {
              if(searchOn=="name"){
                return item.name.toLowerCase().contains(query.toLowerCase());
              }else if(searchOn=="code"){
                return item.code.toLowerCase().contains(query.toLowerCase());
              }else{
                return item.capital.toLowerCase().contains(query.toLowerCase());
              }
            },
            onValuePicked: (IndianState indianState) {
              // setState(() => _selectedDialogCountry = indianState),
            },
            itemBuilder: _buildDialogItem,
          ),
        ),
      );

  Widget _buildDialogItem(IndianState state) => Row(
        children: <Widget>[
          helper.getImage(
              imagePath: state.image, height: 120, width: 80, fit: BoxFit.fill),
          // const SizedBox(width: 8.0),
          // Text("+${indianState.population}"),
          const SizedBox(width: 8.0),
          Flexible(child: Text(state.name))
        ],
      );
}
