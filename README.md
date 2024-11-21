# indian_state_picker

indian_state_picker is a Flutter package that provides an intuitive and customizable state picker
for Indian states. It includes a predefined list of Indian states, but developers can also customize
the list to meet specific requirements. ([pub.dev](https://pub.dev/packages/indian_state_picker)).

## Screenshots

![Vertical Ruler](./v_ruler.gif) ![Horizontal Ruler](./h_ruler.gif)

## How to Use

This example demonstrates how to create a customizable state picker using the indian_state_picker
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

- Code Example:
  Here is a basic implementation to display a list of Indian states and allow the user to select a
  state:

```dart
import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state_picker.dart';

void main() => runApp(StatePickerApp());

class StatePickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatePickerExample(),
    );
  }
}

class StatePickerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Indian State Picker")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Example of using the state picker dialog
            final selectedState = await showDialog<IndianState>(
              context: context,
              builder: (context) {
                return StatePickerDialog(
                  states: indianStateList, // Predefined list of Indian states
                  title: Text('Select a State'),
                  isSearchable: true,
                );
              },
            );
            if (selectedState != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: ${selectedState.name}')),
              );
            }
          },
          child: Text("Pick a State"),
        ),
      ),
    );
  }
}


```

## Key Features

- Predefined and Customizable State Data
    - Predefined list of Indian states with details such as:
        - Name
        - Capital
        - Population
        - Cities count

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
            width: MediaQuery.of(context).size.width * .75,
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