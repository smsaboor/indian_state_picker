import 'package:flutter/material.dart';

/// A helper class for managing and interacting with a list of states or regions.
///
/// This utility provides functionality for finding states by their attributes
/// (such as code, name, or capital) and rendering state-specific images.
///
/// [T] represents the type of the state object.
class StatePickerUtils<T> {
  /// The list of states or regions to manage.
  final List<T> states;

  /// A function that retrieves the code for a given state object.
  final String Function(T) getCode;

  /// A function that retrieves the name for a given state object.
  final String Function(T) getName;

  /// A function that retrieves the capital city for a given state object.
  final String Function(T) getCapital;

  /// A function that retrieves the image path for a given state object.
  final String Function(T) getImagePath;

  /// Constructs a `StatePickerHelper` with the provided state data and helper functions.
  ///
  /// - [states]: A list of states or regions.
  /// - [getCode]: A function to extract the code of a state.
  /// - [getName]: A function to extract the name of a state.
  /// - [getCapital]: A function to extract the capital of a state.
  /// - [getImagePath]: A function to extract the image path of a state.
  StatePickerUtils({
    required this.states,
    required this.getCode,
    required this.getName,
    required this.getCapital,
    required this.getImagePath,
  });

  /// Finds a state by its unique code.
  ///
  /// - [code]: The code to search for.
  /// - Returns: The state object with the matching code.
  /// - Throws: An exception if no state with the given code is found.
  T findStateByCode(String code) {
    for (var state in states) {
      if (getCode(state).equalsIgnoreCase(code)) {
        return state;
      }
    }
    throw Exception("Invalid code provided!");
  }

  /// Finds a state by its name.
  ///
  /// - [name]: The name to search for.
  /// - Returns: The state object with the matching name.
  /// - Throws: An exception if no state with the given name is found.
  T findStateByName(String name) {
    for (var state in states) {
      if (getName(state).equalsIgnoreCase(name)) {
        return state;
      }
    }
    throw Exception("Invalid name provided!");
  }

  /// Finds a state by its capital city.
  ///
  /// - [capital]: The capital city to search for.
  /// - Returns: The state object with the matching capital.
  /// - Throws: An exception if no state with the given capital is found.
  T findStateByCapital(String capital) {
    for (var state in states) {
      if (getCapital(state).equalsIgnoreCase(capital)) {
        return state;
      }
    }
    throw Exception("Invalid capital provided!");
  }

  /// Returns a widget to display the state's image with interactive zoom functionality.
  ///
  /// - [context]: The build context for rendering the dialog.
  /// - [imagePath]: The path or URL of the image to display.
  /// - [height]: The height of the image widget.
  /// - [width]: The width of the image widget.
  /// - [fit]: The box-fit behavior for the image.
  /// - Returns: A `GestureDetector` that displays the image and supports zoom functionality.
  Widget getImage({
    required BuildContext context,
    required String imagePath,
    required double height,
    required double width,
    required BoxFit fit,
  }) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: InteractiveViewer(
              maxScale: 4.0,
              child: imagePath.startsWith('http')
                  ? Image.network(
                      imagePath,
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
            ),
          ),
        );
      },
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
            ),
    );
  }
}

/// An extension for case-insensitive string comparison.
extension StringComparison on String {
  /// Compares two strings, ignoring case differences.
  ///
  /// - [other]: The string to compare against.
  /// - Returns: `true` if the strings are equal, ignoring case; otherwise `false`.
  bool equalsIgnoreCase(String other) {
    return toLowerCase() == other.toLowerCase();
  }
}
