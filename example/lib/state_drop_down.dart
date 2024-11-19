import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state_picker.dart';

class StateDropDown extends StatefulWidget {
  StatePickerHelper<IndianState> helper;
  StateDropDown({super.key, required this.helper});

  @override
  State<StateDropDown> createState() => _StateDropDownState();
}

class _StateDropDownState extends State<StateDropDown> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        Card(
            child: Column(
              children: [
                const Text("Simple Dropdown"),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: StatePickerDropdown<IndianState>(
                    states: indianStateList,
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
                              widget.helper.getImage(
                                  imagePath: state.image,
                                  height: 80,
                                  width: 60,
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
                const Text("Dropdown with top States"),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: StatePickerDropdown<IndianState>(
                    states: indianStateList,
                    topStates: [
                      widget.helper.findStateByCapital('mumbai'),
                      widget.helper.findStateByCode('gj')
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
                              widget.helper.getImage(
                                  imagePath: state.image,
                                  height: 80,
                                  width: 60,
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
                const Text("Dropdown with initial State"),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: StatePickerDropdown<IndianState>(
                    states: indianStateList,
                    initialValue:  widget.helper.findStateByCapital('lucknow'),
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
                              widget.helper.getImage(
                                  imagePath: state.image,
                                  height: 80,
                                  width: 60,
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
