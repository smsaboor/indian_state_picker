# indian_state_picker

indian_state_picker is a Flutter package that provides an intuitive and customizable state picker
for Indian states. It includes a predefined list of Indian states, but developers can also customize
the list to meet specific requirements. ([pub.dev](https://pub.dev/packages/indian_state_picker)).

## Screenshots

![Vertical Ruler](./v_ruler.gif) ![Horizontal Ruler](./h_ruler.gif)

## How to use Indian States Picker with dialog widget or dropdown widget. 

This example demonstrates how to implement Indian State Picker dropdown and dialog using the indian_state_picker
package. The picker allows users to search, select, and view detailed information about Indian
states, including name, capital, population, and cities.

To use this package :

- add the dependency to
  your [pubspec.yaml](https://github.com/smsaboor/indian_state_picker/blob/main/pubspec.yaml) file.

 ```yaml
 dependencies:
   flutter:
     sdk: flutter
   indian_state_picker:
```

- Import the necessary packages:

```packges
import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state_picker.dart';
```

- Example to select indian states with default values:
  Here is a basic implementation to display a list of default Indian states and allow the user to select a
  state:

```dart

class DefaultIndiaState extends StatefulWidget {
  const DefaultIndiaState({super.key});

  @override
  State<DefaultIndiaState> createState() => _DefaultIndiaStateState();
}

class _DefaultIndiaStateState extends State<DefaultIndiaState> {
  StatePickerUtils<IndianState> statePickerUtils =
  StatePickerUtils<IndianState>(
    states: indianStateList,
    getCode: (state) => state.code,
    getName: (state) => state.name,
    getCapital: (state) => state.capital,
    getImagePath: (state) => state.image,
  );

  late IndianState selectedStateOne;
  @override
  void initState() {
    // TODO: implement initState
    selectedStateOne=  statePickerUtils.findStateByCapital('mumbai');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: StatePickerDropdown<IndianState>(
                  isExpanded: true,
                  mainHeight: 140,
                  itemHeight: 130,
                  states: indianStateList,
                  onValuePicked: (state) {
                    // print('Picked: ${state.name}');
                  },
                  itemBuilder: (state) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 140,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            statePickerUtils.getImage(
                              context: context,
                              imagePath: state.image,
                              height: 130,
                              width: 90,
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Theme(
                        data: Theme.of(context).copyWith(primaryColor: Colors.pink),
                        child: StatePickerDialog<IndianState>(
                          states: indianStateList,
                          topStates: [],
                          titlePadding: const EdgeInsets.all(8.0),
                          searchCursorColor: Colors.pinkAccent,
                          searchInputDecoration: const InputDecoration(hintText: 'Search...'),
                          isSearchable: true,
                          title: const Text('Select your State'),
                          searchFilter: (item, query) {
                            return item.name.toLowerCase().contains(query.toLowerCase());
                          },
                          onValuePicked: (IndianState indianState) {
                            setState(() {
                              selectedStateOne = indianState;
                            });
                          },
                          itemBuilder: (IndianState state) => Row(
                            children: <Widget>[
                              statePickerUtils.getImage(
                                  context: context,
                                  imagePath: state.image,
                                  height: 90,
                                  width: 70,
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
                  },
                  title: Row(
                    children: <Widget>[
                      statePickerUtils.getImage(
                          context: context,
                          imagePath: selectedStateOne.image,
                          height: 120,
                          width: 90,
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
              ),
            ],),
        )
    );
  }
}

```

- Example to select indian states with custom values:
  Here is a basic implementation to select developer defined or custom indian states with dialogbox and dropdowns:

```dart
/// A custom widget that displays a state picker with multiple UI options.
class CustomStatePicker extends StatefulWidget {
  const CustomStatePicker({super.key});

  @override
  State<CustomStatePicker> createState() => _CustomStatePickerState();
}

class _CustomStatePickerState extends State<CustomStatePicker> {
  /// List of states with their respective details (name, capital, population, and image).
  List<CustomState> customStates = [
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

  /// Finds a state by its capital. Throws an exception if the state is not found.
  CustomState findStateByCapital(String capital) {
    for (var customState in customStates) {
      if (customState.capital.toLowerCase() == capital.toLowerCase()) {
        return customState;
      }
    }
    throw Exception("State with capital '$capital' not found!");
  }

  @override
  void initState() {
    // Initialize selected states based on capitals
    selectedStateOne = findStateByCapital('mumbai');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Custom Dropdown Picker 
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: StatePickerDropdown<CustomState>(
                mainHeight: 100,
                itemHeight: 90,
                states: customStates,
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
            // Custom Dialog Picker with Search by Name
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Theme(
                    data: Theme.of(context).copyWith(primaryColor: Colors.pink),
                    child: StatePickerDialog<CustomState>(
                      states: customStates,
                      topStates: [],
                      titlePadding: const EdgeInsets.all(8.0),
                      searchCursorColor: Colors.pinkAccent,
                      searchInputDecoration: const InputDecoration(hintText: 'Search...'),
                      isSearchable: true,
                      title: const Text('Select your State'),
                      searchFilter: (item, query) {
                        return item.name.toLowerCase().contains(query.toLowerCase());
                      },
                      onValuePicked: (CustomState indianState) {
                        setState(() {
                          selectedStateOne = indianState;
                        });
                      },
                      itemBuilder: (CustomState state) => Row(
                        children: <Widget>[
                          ZoomableImageWidget(
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
              },
              title: Row(
                children: <Widget>[
                  ZoomableImageWidget(
                      imagePath: selectedStateOne.image,
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
                            'State : ${selectedStateOne.name.length > 20 ? selectedStateOne.name.substring(0, 20) : selectedStateOne.name}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Capital : ${selectedStateOne.capital}'),
                          Text('Population : ${selectedStateOne.population}'),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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

```

## Key Features

- Predefined and Customizable State Data
   - Predefined list of Indian states with details such as:
       - Name
       - Code
       - Capital
       - Population
       - Image
       - Cities cities
       - Area

- Search Functionality
    - Filter states by name, capital, or code for easy selection.
- Interactive State Display
    - Visual display of state details with optional images and customizable text styles.
- Customizable Dialogs
    - Configurable dialogs with or without search functionality.
    - Supports both searchable and non-searchable state pickers.

- For custom state, use the StatePickerDropdown<T> generic class to define custom class:
  ```code
class StatePickerExample extends StatelessWidget {
  const StatePickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Indian State Picker")),
      body: StatePickerDropdown<CustomState>(
        mainHeight: 100,
        itemHeight: 90,
        states: [
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
        ],
        onValuePicked: (state) {
          print('Picked: ${state.name}');
        },
        itemBuilder: (state) {
          return SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width * .75,
            child: Row(
              children: [
                Image.network(state.image,
                    height: 100, width: 70, fit: BoxFit.fill),
                const SizedBox(width: 18.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.capital,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      state.population,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        sortComparator: (a, b) => a.name.compareTo(b.name), // Sort by name
      ),
    );
  }
}
  ```

## Usage
Use this package to implement a user-friendly state picker in your Flutter app. The package is highly versatile, allowing developers to customize the UI and integrate state information into applications like registration forms, travel apps, and location-based services.

## Pull Requests

Pull requests are most welcome. It usually will take me within 24-48 hours to respond to any issue or request.

1.  Please keep PR titles easy to read and descriptive of changes, this will make them easier to merge :)
2.  Pull requests _must_ be made against `develop` branch. Any other branch (unless specified by the maintainers) will get rejected.

### Created & Maintained By
> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> * [PayPal](https://paypal.me/mdsaboor)

# License

    Copyright (c) 2024 [Mohammad Saboor]
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.