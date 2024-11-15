import 'package:indian_state_picker/indian_state.dart';
import 'package:flutter/material.dart';

/// Returns true when a state should be included in lists / dialogs
/// offered to the user.
typedef ItemFilter = bool Function(IndianState indianState);

///Predicate to be satisfied in order to add state to search list
typedef SearchFilter = bool Function(IndianState indianState, String searchWord);

typedef ItemBuilder = Widget Function(IndianState indianState);

/// Simple closure which always returns true.
bool acceptAllIndianStates(_) => true;
