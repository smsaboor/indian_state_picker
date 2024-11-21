import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

/// A custom dropdown widget for selecting states with advanced filtering, sorting,
/// and customization options.
///
/// [StatePickerDropdown] allows you to provide custom filters, sort logic, and
/// item builders, enabling extensive customization for dropdown-based state selection.
///
/// [T] represents the type of the dropdown items.
class StatePickerDropdown<T> extends StatefulWidget {
  /// Creates a `StatePickerDropdown` with the provided configuration.
  const StatePickerDropdown({
    super.key,
    required this.onValuePicked,
    this.itemFilter,
    this.sortComparator,
    this.states,
    this.topStates,
    this.mainHeight,
    this.isEqual,
    this.itemBuilder,
    this.selectedState,
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

  /// Filters the available list of items to only include those that match certain criteria.
  /// Example: Filtering states that start with a specific letter.
  final bool Function(T item)? itemFilter;

  /// A comparator used to sort the list of items. The comparison logic is customizable.
  /// Example: Sorting states alphabetically.
  final Comparator<T>? sortComparator;

  /// A list of items to be displayed at the top of the dropdown.
  /// These items are prioritized over the rest of the list.
  final List<T>? topStates;

  /// A custom equality function used to compare two items.
  /// This is especially useful for identifying duplicates in lists.
  final bool Function(T state, T topState)? isEqual;

  /// The full list of available states/items to be displayed in the dropdown.
  final List<T>? states;

  /// A custom widget builder for rendering each item in the dropdown.
  /// Example: Building a `ListTile` or a `Card` for each item.
  final Widget Function(T item)? itemBuilder;

  /// The initial value selected in the dropdown.
  /// If no initial value is provided, the first item in the list is selected by default.
  final T? selectedState;

  /// A callback triggered whenever an item is selected from the dropdown.
  /// The selected item is passed to the callback function.
  final ValueChanged<T> onValuePicked;

  /// A boolean indicating whether the dropdown expands to fill available space.
  final bool isExpanded;

  /// The height of each dropdown item. Defaults to [kMinInteractiveDimension].
  final double? itemHeight;

  /// The height of each dropdown item. Defaults to [kMinInteractiveDimension].
  final double? mainHeight;

  /// Indicates whether the dropdown should use a compact layout.
  final bool isDense;

  /// The widget displayed under the dropdown. Defaults to an empty widget.
  final Widget? underline;

  /// A custom builder for rendering the selected item.
  final Widget Function(T item)? selectedItemBuilder;

  /// The background color of the dropdown.
  final Color? dropdownColor;

  /// A callback triggered when the dropdown is tapped.
  final VoidCallback? onTap;

  /// The icon displayed to indicate dropdown functionality.
  final Widget? icon;

  /// The color of the icon when the dropdown is disabled.
  final Color? iconDisabledColor;

  /// The color of the icon when the dropdown is enabled.
  final Color? iconEnabledColor;

  /// The size of the dropdown icon. Defaults to 24.0.
  final double iconSize;

  /// A placeholder widget displayed when no item is selected.
  final Widget? hint;

  /// A widget displayed when the dropdown is disabled.
  final Widget? disabledHint;

  /// If `true`, the first item in the list is selected by default
  /// when no initial value is provided.
  final bool isFirstDefaultIfInitialValueNotProvided;

  @override
  State<StatePickerDropdown<T>> createState() => _StatePickerDropdownState<T>();
}

class _StatePickerDropdownState<T> extends State<StatePickerDropdown<T>> {
  late List<T> _states;
  late T? _selectedItem;

  @override
  void initState() {
    super.initState();
    // Filter items based on the provided filter function.
    _states = (widget.states ?? []).toList();
    if (widget.itemFilter != null) {
      _states = _states.where(widget.itemFilter!).toList();
    }

    // Sort items using the provided comparator.
    if (widget.sortComparator != null) {
      _states.sort(widget.sortComparator!);
    }

    // Add top priority items to the beginning of the list.
    if (widget.topStates != null) {
      for (var topState in widget.topStates!) {
        _states.removeWhere((T state) => widget.isEqual!(state, topState));
      }
      _states.insertAll(0, widget.topStates!);
    }

    // Set the initial selected value.
    if (widget.selectedState != null) {
      _selectedItem = widget.selectedState;
    } else if (widget.isFirstDefaultIfInitialValueNotProvided &&
        _states.isNotEmpty) {
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

    return DropdownButton2<T>(
      hint: widget.hint,
      disabledHint: widget.disabledHint,
      buttonStyleData: ButtonStyleData(
        height: widget.mainHeight,
      ),
      menuItemStyleData: MenuItemStyleData(
        height: widget.itemHeight ?? 10,
      ),
      // onTap: widget.onTap,
      // icon: widget.icon,
      // iconSize: widget.iconSize,
      // iconDisabledColor: widget.iconDisabledColor,
      // iconEnabledColor: widget.iconEnabledColor,
      // dropdownColor: widget.dropdownColor,
      underline: widget.underline ?? const SizedBox(),
      isDense: widget.isDense,
      isExpanded: widget.isExpanded,
      value: _selectedItem,
      // itemHeight: widget.itemHeight,
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
          ? (context) =>
              _states.map((item) => widget.selectedItemBuilder!(item)).toList()
          : null,
    );
  }
}
