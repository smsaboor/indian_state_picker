import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state_picker.dart';

/// A custom widget that displays a state picker with multiple UI options.
class CustomStatePicker extends StatefulWidget {
  const CustomStatePicker({super.key});

  @override
  State<CustomStatePicker> createState() => _CustomStatePickerState();
}

class _CustomStatePickerState extends State<CustomStatePicker> {
  /// List of states with their respective details (name, capital, population, and image).
  List<CustomState> states = [
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/IN-AN.svg/300px-IN-AN.svg.png',
        population: '400,000',
        capital: 'Port Blair',
        name: "Andaman and Nicobar Islands"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/IN-AP.svg/300px-IN-AP.svg.png',
        population: '52,000,000',
        capital: 'Amaravati',
        name: "Andhra Pradesh"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/IN-AR.svg/300px-IN-AR.svg.png',
        population: '1,600,000',
        capital: 'Itanagar',
        name: "Arunachal Pradesh"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/IN-GA.svg/300px-IN-GA.svg.png',
        population: '125,000,000',
        capital: 'Patna',
        name: "Bihar"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/IN-CH.svg/300px-IN-CH.svg.png',
        population: '1,200,000',
        capital: 'Chandigarh',
        name: "Chandigarh"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/IN-CT.svg/300px-IN-CT.svg.png',
        population: '32,000,000',
        capital: 'Raipur',
        name: "Chhattisgarh"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/IN-DN.svg/250px-IN-DN.svg.png',
        population: '690,000',
        capital: 'Daman',
        name: "Dadra and Nagar Haveli and Daman and Diu"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/IN-GA.svg/300px-IN-GA.svg.png',
        population: '20,140,000',
        capital: 'New Delhi',
        name: "Delhi"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/IN-GA.svg/300px-IN-GA.svg.png',
        population: '1,650,000',
        capital: 'Panaji',
        name: "Goa"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/IN-GJ.svg/300px-IN-GJ.svg.png',
        population: '71,507,000',
        capital: 'Gandhinagar',
        name: "Gujarat"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/IN-HR.svg/300px-IN-HR.svg.png',
        population: '29,000,000',
        capital: 'Chandigarh',
        name: "Haryana"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/IN-HP.svg/300px-IN-HP.svg.png',
        population: '7,300,000',
        capital: 'Shimla',
        name: "Himachal Pradesh"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/IN-GA.svg/300px-IN-GA.svg.png',
        population: '13,600,000',
        capital: 'Srinagar (summer), Jammu (winter)',
        name: "Jammu and Kashmir"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/IN-JH.svg/512px-IN-JH.svg.png',
        population: '38,000,000',
        capital: 'Ranchi',
        name: "Jharkhand"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/IN-KA.svg/300px-IN-KA.svg.png',
        population: '67,692,000',
        capital: 'Bengaluru',
        name: "Karnataka"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/IN-KL.svg/300px-IN-KL.svg.png',
        population: '35,776,000',
        capital: 'Thiruvananthapuram',
        name: "Kerala"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/IN-LD.svg/300px-IN-LD.svg.png',
        population: '65,000',
        capital: 'Kavaratti',
        name: "Lakshadweep"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/IN-GA.svg/300px-IN-GA.svg.png',
        population: '290,000',
        capital: 'Leh',
        name: "Ladakh"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/IN-MH.svg/300px-IN-MH.svg.png',
        population: '126,385,000',
        capital: 'Mumbai',
        name: "Maharashtra"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/IN-MN.svg/300px-IN-MN.svg.png',
        population: '2,855,000',
        capital: 'Imphal',
        name: "Manipur"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/IN-OD.svg/300px-IN-OD.svg.png',
        population: '46,000,000',
        capital: 'Bhubaneswar',
        name: "Odisha"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/IN-GA.svg/300px-IN-GA.svg.png',
        population: '1,600,000',
        capital: 'Puducherry',
        name: "Puducherry"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/IN-RJ.svg/512px-IN-RJ.svg.png',
        population: '81,025,000',
        capital: 'Jaipur',
        name: "Rajasthan"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/IN-GA.svg/300px-IN-GA.svg.png',
        population: '750,000',
        capital: 'Gangtok',
        name: "Sikkim"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/IN-TN.svg/300px-IN-TN.svg.png',
        population: '76,860,000',
        capital: 'Chennai',
        name: "Tamil Nadu"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/IN-TG.svg/300px-IN-TG.svg.png',
        population: '40,000,000',
        capital: 'Hyderabad',
        name: "Telangana"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/IN-TR.svg/300px-IN-TR.svg.png',
        population: '4,000,000',
        capital: 'Agartala',
        name: "Tripura"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/IN-UT.svg/300px-IN-UT.svg.png',
        population: '11,000,000',
        capital: 'Dehradun',
        name: "Uttarakhand"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/IN-UP.svg/800px-IN-UP.svg.png',
        population: '235,687,000',
        capital: 'Lucknow',
        name: "Uttar Pradesh"),
    CustomState(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/IN-WB.svg/300px-IN-WB.svg.png',
        population: '99,084,000',
        capital: 'Kolkata',
        name: "West Bengal"),
  ];
  // Image dimensions
  double imageHeight = 120;
  double imageWidth = 90;

  double mainHeight = 100;
  double itemHeight = 90;

  // Pre-selected states
  late CustomState selectedStateOne;
  late CustomState selectedStateTwo;
  late CustomState selectedStateThree;

  /// Finds a state by its capital. Throws an exception if the state is not found.
  CustomState findStateByCapital(String capital) {
    for (var state in states) {
      if (state.capital.toLowerCase() == capital.toLowerCase()) {
        return state;
      }
    }
    throw Exception("State with capital '$capital' not found!");
  }

  @override
  void initState() {
    // Initialize selected states based on capitals
    selectedStateOne = findStateByCapital('mumbai');
    selectedStateTwo = findStateByCapital('gandhinagar');
    selectedStateThree = findStateByCapital('lucknow');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        // Dropdown Picker Card
        Card(
            child: Column(
          children: [
            const Text(" Simple Dropdown"),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: StatePickerDropdown<CustomState>(
                mainHeight: 100,
                itemHeight: 90,
                states: states,
                onValuePicked: (state) {
                  // print('Picked: ${state.name}');
                },
                itemBuilder: (state) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Row(
                      children: [
                        ZoomableImageWidget(
                            imagePath: state.image,
                            height: 100,
                            width: 70,
                            fit: BoxFit.fill),
                        const SizedBox(width: 18.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.name.length > 28
                                  ? state.name.substring(0, 28)
                                  : state.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: state.name.length > 28 ? 12 : 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              state.capital.length > 25
                                  ? state.capital.substring(0, 25)
                                  : state.capital,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: state.name.length > 25 ? 12 : 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              state.population,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
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
        // Dialog Picker with Search by Name
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
                      states: states,
                      selectedState: 2,
                      topStates: []);
                },
                title: Row(
                  children: <Widget>[
                    ZoomableImageWidget(
                        imagePath: selectedStateTwo.image,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill),
                    // const SizedBox(width: 8.0),
                    // Text("+${indianState.population}"),
                    const SizedBox(width: 18.0),
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'State : ${selectedStateTwo.name.length > 20 ? selectedStateTwo.name.substring(0, 20) : selectedStateTwo.name}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Capital : ${selectedStateTwo.capital}'),
                        Text('Population : ${selectedStateTwo.population}'),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
        // Dialog Picker with Search by Capital
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
                      states: states,
                      selectedState: 3,
                      topStates: []);
                },
                title: Row(
                  children: <Widget>[
                    ZoomableImageWidget(
                        imagePath: selectedStateThree.image,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill),
                    // const SizedBox(width: 8.0),
                    // Text("+${indianState.population}"),
                    const SizedBox(width: 18.0),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'State : ${selectedStateThree.name}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Capital : ${selectedStateThree.capital}'),
                        Text('Population : ${selectedStateThree.population}'),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Opens a country picker dialog with search functionality.
  void _openCountryPickerDialog(
          {required List<CustomState> states,
          required bool isSearchable,
          required List<CustomState> topStates,
          required String searchOn,
          required double selectedState}) =>
      showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: StatePickerDialog<CustomState>(
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
              } else {
                return item.capital.toLowerCase().contains(query.toLowerCase());
              }
            },
            onValuePicked: (CustomState indianState) {
              setState(() {
                if (selectedState == 1) selectedStateOne = indianState;
                if (selectedState == 2) selectedStateTwo = indianState;
                if (selectedState == 3) selectedStateThree = indianState;
              });
            },
            itemBuilder: (CustomState state) {
              return Column(
                children: [
                  Row(
                    children: <Widget>[
                      ZoomableImageWidget(
                          imagePath: state.image,
                          height: 80,
                          width: 60,
                          fit: BoxFit.fill),
                      // const SizedBox(width: 8.0),
                      // Text("+${indianState.population}"),
                      const SizedBox(width: 8.0),
                      Flexible(
                          child: Column(
                        children: [
                          Text(state.name),
                          Text('(${state.capital})'),
                        ],
                      )),
                    ],
                  ),
                ],
              );
            },
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
