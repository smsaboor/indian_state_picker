
import 'package:flutter/material.dart';


class StatePickerDropdown<T> extends StatefulWidget {
  const StatePickerDropdown({
    super.key,
    required this.onValuePicked,
    this.itemFilter,
    this.sortComparator,
    this.states,
    this.topStates,
    this.isEqual,
    this.itemBuilder,
    this.initialValue,
    this.isExpanded = false,
    this.itemHeight = kMinInteractiveDimension,
    this.selectedItemBuilder,
    this.isDense = false,
    this.underline,
    this.dropdownColor,
    this.onTap,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 24.0,
    this.hint,
    this.disabledHint,
    this.isFirstDefaultIfInitialValueNotProvided = true,
  });

  /// Filters the available list of items
  final bool Function(T item)? itemFilter;

  /// [Comparator] to be used in sorting the list of items
  final Comparator<T>? sortComparator;

  /// List of items that are placed on top
  final List<T>? topStates;

  /// Custom equality function to compare two items
  final bool Function(T state, T topState)? isEqual;


  final List<T>? states;

  /// Function to build the child of `DropdownMenuItem`
  final Widget Function(T item)? itemBuilder;

  /// Initial value selected in the dropdown
  final T? initialValue;

  /// This function is called whenever an item is selected
  final ValueChanged<T> onValuePicked;

  /// Boolean property to enable/disable expanded property of `DropdownButton`
  final bool isExpanded;

  /// See [itemHeight] of `DropdownButton`
  final double? itemHeight;

  /// See [isDense] of `DropdownButton`
  final bool isDense;

  /// See [underline] of `DropdownButton`
  final Widget? underline;

  /// Selected item widget builder to display
  final Widget Function(T item)? selectedItemBuilder;

  /// See [dropdownColor] of `DropdownButton`
  final Color? dropdownColor;

  /// See [onTap] of `DropdownButton`
  final VoidCallback? onTap;

  /// See [icon] of `DropdownButton`
  final Widget? icon;

  /// See [iconDisabledColor] of `DropdownButton`
  final Color? iconDisabledColor;

  /// See [iconEnabledColor] of `DropdownButton`
  final Color? iconEnabledColor;

  /// See [iconSize] of `DropdownButton`
  final double iconSize;

  /// See [hint] of `DropdownButton`
  final Widget? hint;

  /// See [disabledHint] of `DropdownButton`
  final Widget? disabledHint;

  /// Set the first item in the list as selected initially if initialValue is not provided
  final bool isFirstDefaultIfInitialValueNotProvided;

  @override
  State<StatePickerDropdown<T>> createState() => _StatePickerDropdownState<T>();
}

class _StatePickerDropdownState<T> extends State<StatePickerDropdown<T>> {
  late List<T> _states;
  late T _selectedItem;

  @override
  void initState() {
    super.initState();
    // Filter items
    _states = (widget.states ?? []).toList();
    if (widget.itemFilter != null) {
      _states = _states.where(widget.itemFilter!).toList();
    }

    // Sort items
    if (widget.sortComparator != null) {
      _states.sort(widget.sortComparator!);
    }

    if (widget.topStates != null) {
      for (var topState in widget.topStates!) {
        _states.removeWhere((T state) => widget.isEqual!(state, topState));
      }
      _states.insertAll(0, widget.topStates!);
    }

    // Set initial value
    if (widget.initialValue != null) {
      _selectedItem = widget.initialValue!;
    } else if (widget.isFirstDefaultIfInitialValueNotProvided && _states.isNotEmpty) {
      _selectedItem = _states.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _states
        .map((item) => DropdownMenuItem<T>(
      value: item,
      child: widget.itemBuilder != null
          ? widget.itemBuilder!(item)
          : Text(item.toString()),
    ))
        .toList();

    return DropdownButton<T>(
      hint: widget.hint,
      disabledHint: widget.disabledHint,
      onTap: widget.onTap,
      icon: widget.icon,
      iconSize: widget.iconSize,
      iconDisabledColor: widget.iconDisabledColor,
      iconEnabledColor: widget.iconEnabledColor,
      dropdownColor: widget.dropdownColor,
      underline: widget.underline ?? const SizedBox(),
      isDense: widget.isDense,
      isExpanded: widget.isExpanded,
      value: _selectedItem,
      itemHeight: widget.itemHeight,
      items: items,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedItem = value;
            widget.onValuePicked(value);
          });
        }
      },
      selectedItemBuilder: widget.selectedItemBuilder != null
          ? (context) => _states.map((item) => widget.selectedItemBuilder!(item)).toList()
          : null,
    );
  }
}
