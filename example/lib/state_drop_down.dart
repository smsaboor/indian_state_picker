import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state_picker.dart';

class StateDropDown extends StatefulWidget {
  StatePickerUtils<IndianState> helper;
  StateDropDown({super.key, required this.helper});
  @override
  State<StateDropDown> createState() => _StateDropDownState();
}

class _StateDropDownState extends State<StateDropDown> {
  double imageHeight = 120;
  double imageWidth = 90;
  double mainHeight = 100;
  double itemHeight = 90;

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
                    isExpanded: true,
                    mainHeight:mainHeight,
                    itemHeight: itemHeight,
                    states: indianStateList,
                    onValuePicked: (state) {
                      print('Picked: ${state.name}');
                    },
                    itemBuilder: (state) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: mainHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              widget.helper.getImage(
                                context: context,
                                imagePath: state.image,
                                height: imageHeight,
                                width: imageWidth,
                                fit: BoxFit.fill,
                              ), // State flag
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  state.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
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
                    mainHeight:mainHeight,
                    itemHeight: itemHeight,
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
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: mainHeight,
                        child: Row(
                          children: [
                            widget.helper.getImage(
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
                    mainHeight: mainHeight,
                    itemHeight: itemHeight,
                    states: indianStateList,
                    initialValue:  widget.helper.findStateByCapital('lucknow'),
                    onValuePicked: (state) {
                      print('Picked: ${state.name}');
                    },
                    itemBuilder: (state) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: mainHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              widget.helper.getImage(
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
                    sortComparator: (a, b) => a.name.compareTo(b.name), // Sort by name
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
