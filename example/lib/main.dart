import 'package:example/statePicker.dart';
import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state_picker.dart';

// Dimensions for images and items.
double imageHeight = 120;
double imageWidth = 90;
double mainHeight = 100;
double itemHeight = 90;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Indian State Picker',
      home:  CustomStatePicker(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  StatePickerUtils<IndianState> statePickerUtils =
      StatePickerUtils<IndianState>(
    states: indianStateList,
    getCode: (state) => state.code,
    getName: (state) => state.name,
    getCapital: (state) => state.capital,
    getImagePath: (state) => state.image,
  );

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Indian State Pickers Demo'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Dropdown'),
              Tab(text: 'Dialog'),
              Tab(text: 'Custom'),
            ],
          ),
        ),
        body: TabBarView(controller: _tabController, children: [
          DemoStatePickerDropDown(statePickerUtils: statePickerUtils),
          DemoStatePickerDialog(statePickerUtils: statePickerUtils),
          const CustomStatePicker()
        ]));
  }
}



/// A dropdown widget to select Indian states based on different attributes like name, capital, etc.
class DemoStatePickerDropDown extends StatefulWidget {
  final StatePickerUtils<IndianState> statePickerUtils;
  const DemoStatePickerDropDown({super.key, required this.statePickerUtils});

  @override
  State<DemoStatePickerDropDown> createState() => _DemoStatePickerDropDownState();
}

class _DemoStatePickerDropDownState extends State<DemoStatePickerDropDown>   {
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


/// A dialog widget to select Indian states based on different attributes like name, capital, etc.
class DemoStatePickerDialog extends StatefulWidget {
  /// A utility to manage state-related operations.
  final StatePickerUtils<IndianState> statePickerUtils;
  const DemoStatePickerDialog({super.key, required this.statePickerUtils});

  @override
  State<DemoStatePickerDialog> createState() => _DemoStatePickerDialogState();
}

class _DemoStatePickerDialogState extends State<DemoStatePickerDialog> {
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







class CustomState {
  final String name;
  final String population;
  final String image;
  final String capital;

  CustomState({
    required this.image,
    required this.population,
    required this.name,
    required this.capital,
  });

  factory CustomState.fromMap(Map<String, dynamic> map) {
    return CustomState(
      name: map['name'] as String,
      image: map['image'] as String,
      population: map['population'] as String,
      capital: map['capital'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'population': population,
      'image': image,
      'capital': capital,
    };
  }
}

class ZoomableImageWidget extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final BoxFit fit;

  const ZoomableImageWidget({
    required this.imagePath,
    this.height = 100.0,
    this.width = 100.0,
    this.fit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              child: InteractiveViewer(
                maxScale: 4.0,
                child: Image.network(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
        // If it's a URL, return a NetworkImage
        child: imagePath.startsWith('http')
            ? Image.network(
          imagePath,
          height: height,
          width: width,
          fit: fit,
        )
            : Image.asset(
          imagePath,
          height: height,
          width: width,
          fit: fit,
        ));
  }
}
