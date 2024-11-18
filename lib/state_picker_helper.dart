

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class StatePickerHelper<T> {
  final List<T> states;
  final String Function(T) getCode;
  final String Function(T) getName;
  final String Function(T) getCapital;
  final String Function(T) getImagePath;

  StatePickerHelper({
    required this.states,
    required this.getCode,
    required this.getName,
    required this.getCapital,
    required this.getImagePath,
  });

  T findStateByCode(String code) {
    for (var state in states) {
      if (getCode(state).equalsIgnoreCase(code)) {
        return state;
      }
    }
    throw Exception("Invalid code provided!");
  }

  T findStateByName(String name) {
    for (var state in states) {
      if (getName(state).equalsIgnoreCase(name)) {
        return state;
      }
    }
    throw Exception("Invalid name provided!");
  }

  T findStateByCapital(String capital) {
    for (var state in states) {
      if (getCapital(state).equalsIgnoreCase(capital)) {
        return state;
      }
    }
    throw Exception("Invalid capital provided!");
  }

  Widget getImage({required String imagePath, required double height, required double width, required BoxFit fit}) {
    // Check if the image path is a URL (starts with 'http')
    if (imagePath.startsWith('http')) {
      // If it's a URL, return a NetworkImage
      return Image.network(
        imagePath,
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      // If it's not a URL, return an AssetImage
      return Image.asset(
        imagePath,
        height: height,
        width: width,
        fit: fit,
      );
    }
  }
}

// Adding a helper extension for case-insensitive string comparison
extension StringComparison on String {
  bool equalsIgnoreCase(String other) {
    return this.toLowerCase() == other.toLowerCase();
  }
}
