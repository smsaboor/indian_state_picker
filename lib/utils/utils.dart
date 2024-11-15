import 'package:indian_state_picker/indianStates.dart';
import 'package:indian_state_picker/indian_state.dart';
import 'package:flutter/widgets.dart';

class IndianStatePickerUtils {
  static IndianState getStateByCode(String isoCode) {
    try {
      return indianStateList.firstWhere(
        (state) => state.code.toLowerCase() == isoCode.toLowerCase(),
      );
    } catch (error) {
      throw Exception("The initialValue provided is not a supported iso code!");
    }
  }

  static IndianState getIndianStateByName(String name) {
    try {
      return indianStateList.firstWhere(
        (state) => state.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (error) {
      throw Exception("The initialValue provided is not a supported name!");
    }
  }

  static String getStateImageAssetPath(String stateCode) {
    return "assets/${stateCode.toLowerCase()}.jpg";
  }

  static Widget getStateImage(IndianState indianState, double height, double width) {
    return Image.asset(
      IndianStatePickerUtils.getStateImageAssetPath(indianState.code),
      height: height,
      width: width,
      fit: BoxFit.fill,
      package: "indian_state_picker",
    );
  }

  static IndianState getStateByCapital(String capital) {
    try {
      return indianStateList.firstWhere(
        (state) => state.capital.toLowerCase() == capital.toLowerCase(),
      );
    } catch (error) {
      throw Exception(
          "The initialValue provided is not a supported caapital!");
    }
  }
}
