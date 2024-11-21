import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state_picker.dart';

class StateDropDown extends StatefulWidget {
  final StatePickerUtils<IndianState> statePickerUtils;
  const StateDropDown({super.key, required this.statePickerUtils});

  @override
  State<StateDropDown> createState() => _StateDropDownState();
}

class _StateDropDownState extends State<StateDropDown> {
  double imageHeight = 120;
  double imageWidth = 90;
  double mainHeight = 130;
  double itemHeight = 140;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        Card(
            child: Column(
          children: [
            const Text("Simple Dropdown"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: StatePickerDropdown<IndianState>(
                isExpanded: true,
                mainHeight: mainHeight,
                itemHeight: itemHeight,
                states: indianStateList,
                onValuePicked: (state) {
                  // print('Picked: ${state.name}');
                },
                itemBuilder: (state) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: mainHeight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          widget.statePickerUtils.getImage(
                            context: context,
                            imagePath: state.image,
                            height: imageHeight,
                            width: imageWidth,
                            fit: BoxFit.fill,
                          ), // State flag
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "State: ${state.name.length > 20 ? state.name.substring(0, 20) : state.name}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          state.name.length > 20 ? 10 : 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Capital: ${state.capital}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          state.name.length > 20 ? 10 : 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "Population: ${state.population}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "Cities: ${state.cities.length.toString()}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
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
            const Text("Dropdown with top States"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: StatePickerDropdown<IndianState>(
                mainHeight: mainHeight,
                itemHeight: itemHeight,
                states: indianStateList,
                topStates: [
                  widget.statePickerUtils.findStateByCapital('mumbai'),
                  widget.statePickerUtils.findStateByCode('gj')
                ],
                isEqual: (state, topState) => state.code == topState.code,
                onValuePicked: (state) {
                  // print('Picked: ${state.name}');
                },
                itemBuilder: (state) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: mainHeight,
                    child: Row(
                      children: [
                        widget.statePickerUtils.getImage(
                            context: context,
                            imagePath: state.image,
                            height: imageHeight,
                            width: imageWidth,
                            fit: BoxFit.fill), // State flag
                        const SizedBox(width: 18.0),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.name.length > 20 ? state.name.substring(0, 20) : state.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          state.name.length > 20 ? 10 : 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  state.capital,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          state.name.length > 20 ? 10 : 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  state.population,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  state.cities.length.toString(),
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
            const Text("Dropdown with selected State"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: StatePickerDropdown<IndianState>(
                mainHeight: mainHeight,
                itemHeight: itemHeight,
                states: indianStateList,
                selectedState: widget.statePickerUtils.findStateByCapital('lucknow'),
                onValuePicked: (state) {
                  // print('Picked: ${state.name}');
                },
                itemBuilder: (state) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: mainHeight,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          widget.statePickerUtils.getImage(
                              context: context,
                              imagePath: state.image,
                              height: imageHeight,
                              width: imageWidth,
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
      ],
    );
  }
}
