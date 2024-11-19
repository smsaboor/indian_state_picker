
import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state_picker.dart';


class StateDialog extends StatefulWidget {
  StatePickerHelper<IndianState> helper;
  StateDialog({super.key, required this.helper});

  @override
  State<StateDialog> createState() => _StateDialogState();
}

class _StateDialogState extends State<StateDialog> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
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
                    widget.helper.getImage(
                        imagePath: widget.helper.findStateByCode('mp').image,
                        height: 80,
                        width: 60,
                        fit: BoxFit.fill),
                    // const SizedBox(width: 8.0),
                    // Text("+${indianState.population}"),
                    const SizedBox(width: 8.0),
                    Flexible(
                        child: Text(widget.helper.findStateByCode('mp').name))
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
                    widget.helper.getImage(
                        imagePath: widget.helper.findStateByCode('mp').image,
                        height: 80,
                        width: 60,
                        fit: BoxFit.fill),
                    // const SizedBox(width: 8.0),
                    // Text("+${indianState.population}"),
                    const SizedBox(width: 8.0),
                    Flexible(
                        child: Text(widget.helper.findStateByCode('mp').name))
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
                    widget.helper.getImage(
                        imagePath: widget.helper.findStateByCode('mp').image,
                        height: 80,
                        width: 60,
                        fit: BoxFit.fill),
                    // const SizedBox(width: 8.0),
                    // Text("+${indianState.population}"),
                    const SizedBox(width: 8.0),
                    Flexible(
                        child: Text(widget.helper.findStateByCode('mp').name))
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
                    topStates: [
                      widget.helper.findStateByCode('UP'),
                      widget.helper.findStateByCode('MH'),
                    ],
                  );
                },
                title: Row(
                  children: <Widget>[
                    widget.helper.getImage(
                        imagePath: widget.helper.findStateByCode('mp').image,
                        height: 80,
                        width: 60,
                        fit: BoxFit.fill),
                    // const SizedBox(width: 8.0),
                    // Text("+${indianState.population}"),
                    const SizedBox(width: 8.0),
                    Flexible(
                        child: Text(widget.helper.findStateByCode('mp').name))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
              if (searchOn == "name") {
                return item.name.toLowerCase().contains(query.toLowerCase());
              } else if (searchOn == "code") {
                return item.code.toLowerCase().contains(query.toLowerCase());
              } else {
                return item.capital.toLowerCase().contains(query.toLowerCase());
              }
            },
            onValuePicked: (IndianState indianState) {
              // setState(() => _selectedDialogCountry = indianState),
            },
            itemBuilder: (IndianState state) => Row(
              children: <Widget>[
                widget.helper.getImage(
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

