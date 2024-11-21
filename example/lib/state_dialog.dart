import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state_picker.dart';

/// A dialog widget to select Indian states based on different attributes like name, capital, etc.
class StateDialog extends StatefulWidget {
  /// A utility to manage state-related operations.
  final StatePickerUtils<IndianState> statePickerUtils;
  const StateDialog({super.key, required this.statePickerUtils});

  @override
  State<StateDialog> createState() => _StateDialogState();
}

class _StateDialogState extends State<StateDialog> {
  // Dimensions for images and items.
  double imageHeight = 120;
  double imageWidth = 90;
  double mainHeight = 100;
  double itemHeight = 90;

  // Variables to store selected states.
  late IndianState selectedStateOne;
  late IndianState selectedStateTwo;
  late IndianState selectedStateThree;

  @override
  void initState() {
    // Initialize selected states by searching based on their capitals.
    selectedStateOne = widget.statePickerUtils.findStateByCapital('mumbai');
    selectedStateTwo =
        widget.statePickerUtils.findStateByCapital('gandhinagar');
    selectedStateThree = widget.statePickerUtils.findStateByCapital('lucknow');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        // Card for searching state by name
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Dialog with search state by name"),
              ListTile(
                onTap: () {
                  // Open dialog with search enabled for state name.
                  _openCountryPickerDialog(
                      isSearchable: true,
                      searchOn: "name",
                      states: indianStateList,
                      selectedState: 1,
                      topStates: []);
                },
                title: Row(
                  children: <Widget>[
                    widget.statePickerUtils.getImage(
                        context: context,
                        imagePath: selectedStateOne.image,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill),
                    // const SizedBox(width: 8.0),
                    // Text("+${indianState.population}"),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedStateOne.name.length > 20
                                  ? selectedStateOne.name.substring(0, 20)
                                  : selectedStateOne.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: selectedStateOne.name.length > 20
                                      ? 10
                                      : 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              selectedStateOne.capital,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: selectedStateOne.name.length > 20
                                      ? 10
                                      : 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              selectedStateOne.population,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              selectedStateOne.cities.length.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Card for searching state by capital
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Dialog with search state by capital"),
              ListTile(
                onTap: () {
                  // Open dialog with search enabled for state capital.
                  _openCountryPickerDialog(
                      isSearchable: true,
                      searchOn: "capital",
                      states: indianStateList,
                      selectedState: 2,
                      topStates: []);
                },
                title: Row(
                  children: <Widget>[
                    widget.statePickerUtils.getImage(
                        context: context,
                        imagePath: selectedStateTwo.image,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill),
                    // const SizedBox(width: 8.0),
                    // Text("+${indianState.population}"),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedStateTwo.name.length > 20
                                  ? selectedStateTwo.name.substring(0, 20)
                                  : selectedStateTwo.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: selectedStateTwo.name.length > 20
                                      ? 10
                                      : 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              selectedStateTwo.capital,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: selectedStateTwo.name.length > 20
                                      ? 10
                                      : 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              selectedStateTwo.population,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              selectedStateTwo.cities.length.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Flexible(
                    //     child: Text(widget.helper.findStateByCode('mp').name))
                  ],
                ),
              ),
            ],
          ),
        ),
        // Card for a dialog without a search bar
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Dialog without search bar"),
              ListTile(
                onTap: () {
                  // Open dialog without search functionality.
                  _openCountryPickerDialog(
                    isSearchable: false,
                    searchOn: "name",
                    states: indianStateList,
                    selectedState: 3,
                    topStates: [
                      widget.statePickerUtils.findStateByCode('UP'),
                      widget.statePickerUtils.findStateByCode('MH'),
                    ],
                  );
                },
                title: Row(
                  children: <Widget>[
                    widget.statePickerUtils.getImage(
                        context: context,
                        imagePath: selectedStateThree.image,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill),
                    // const SizedBox(width: 8.0),
                    // Text("+${indianState.population}"),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedStateThree.name.length > 20
                                  ? selectedStateThree.name.substring(0, 20)
                                  : selectedStateThree.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: selectedStateThree.name.length > 20
                                      ? 10
                                      : 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              selectedStateThree.capital,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: selectedStateThree.name.length > 20
                                      ? 10
                                      : 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              selectedStateThree.population,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              selectedStateThree.cities.length.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Opens the state picker dialog.
  void _openCountryPickerDialog(
          {required List<IndianState> states,
          required bool isSearchable,
          required List<IndianState> topStates,
          required String searchOn,
          required double selectedState}) =>
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
              if (searchOn == "name") {
                return item.name.toLowerCase().contains(query.toLowerCase());
              } else if (searchOn == "code") {
                return item.code.toLowerCase().contains(query.toLowerCase());
              } else {
                return item.capital.toLowerCase().contains(query.toLowerCase());
              }
            },
            onValuePicked: (IndianState indianState) {
              setState(() {
                if (selectedState == 1) selectedStateOne = indianState;
                if (selectedState == 2) selectedStateTwo = indianState;
                if (selectedState == 3) selectedStateThree = indianState;
              });
            },
            itemBuilder: (IndianState state) => Row(
              children: <Widget>[
                widget.statePickerUtils.getImage(
                    context: context,
                    imagePath: state.image,
                    height: 80,
                    width: 60,
                    fit: BoxFit.fill),
                // const SizedBox(width: 8.0),
                // Text("+${indianState.population}"),
                const SizedBox(width: 8.0),
                Flexible(child: Text(state.name))
              ],
            ),
          ),
        ),
      );
}
