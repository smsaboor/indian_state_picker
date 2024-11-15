import 'package:indian_state_picker/indian_state.dart';
import 'package:indian_state_picker/indianStates.dart';
import 'package:indian_state_picker/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'utils/utils.dart';

///Provides a customizable [DropdownButton] for all indianStates
class IndianStatePickerDropdown extends StatefulWidget {
  const IndianStatePickerDropdown({super.key,
    required this.onValuePicked,
    this.itemFilter,
    this.sortComparator,
    this.priorityList,
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

  /// Filters the available indianState list
  final ItemFilter? itemFilter;

  /// [Comparator] to be used in sort of indianState list
  final Comparator<IndianState>? sortComparator;

  /// List of indianStates that are placed on top
  final List<IndianState>? priorityList;

  ///This function will be called to build the child of DropdownMenuItem
  ///If it is not provided, default one will be used which displays
  ///flag image, isoCode and phoneCode in a row.
  ///Check _buildDefaultMenuItem method for details.
  final ItemBuilder? itemBuilder;

  ///It should be one of the ISO ALPHA-2 Code that is provided
  ///in indianStateList map of indianStates.dart file.
  final String? initialValue;

  ///This function will be called whenever a indianState item is selected.
  final ValueChanged<IndianState> onValuePicked;

  /// Boolean property to enabled/disable expanded property of DropdownButton
  final bool isExpanded;

  /// See [itemHeight] of [DropdownButton]
  final double? itemHeight;

  /// See [isDense] of [DropdownButton]
  final bool isDense;

  /// See [underline] of [DropdownButton]
  final Widget? underline;

  /// Selected indianState widget builder to display. See [selectedItemBuilder] of [DropdownButton]
  final ItemBuilder? selectedItemBuilder;

  /// See [dropdownColor] of [DropdownButton]
  final Color? dropdownColor;

  /// See [onTap] of [DropdownButton]
  final VoidCallback? onTap;

  /// See [icon] of [DropdownButton]
  final Widget? icon;

  /// See [iconDisabledColor] of [DropdownButton]
  final Color? iconDisabledColor;

  /// See [iconEnabledColor] of [DropdownButton]
  final Color? iconEnabledColor;

  /// See [iconSize] of [DropdownButton]
  final double iconSize;

  /// See [hint] of [DropdownButton]
  final Widget? hint;

  /// See [disabledHint] of [DropdownButton]
  final Widget? disabledHint;

  /// Set first item in the indianState list as selected initially
  /// if initialValue is not provided
  final bool isFirstDefaultIfInitialValueNotProvided;

  @override
  State<IndianStatePickerDropdown> createState() => _IndianStatePickerDropdownState();
}

class _IndianStatePickerDropdownState extends State<IndianStatePickerDropdown> {
  late List<IndianState> _indianStates;
  late IndianState _selectedIndianState;

  @override
  void initState() {
    _indianStates =
        indianStateList.where(widget.itemFilter ?? acceptAllIndianStates).toList();

    if (widget.sortComparator != null) {
      _indianStates.sort(widget.sortComparator);
    }

    if (widget.priorityList != null) {
      for (var indianState in widget.priorityList!) {
        _indianStates.removeWhere((IndianState c) => indianState.code == c.code);
      }
      _indianStates.insertAll(0, widget.priorityList!);
    }

    if (widget.initialValue != null) {
      try {
        _selectedIndianState = _indianStates.firstWhere(
          (indianState) => indianState.code == widget.initialValue!.toUpperCase(),
        );
      } catch (error) {
        throw Exception(
            "The initialValue provided is not a supported iso code!");
      }
    } else {
      if (widget.isFirstDefaultIfInitialValueNotProvided &&
          _indianStates.isNotEmpty) {
        _selectedIndianState = _indianStates[0];
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<IndianState>> items = _indianStates
        .map((indianState) => DropdownMenuItem<IndianState>(
            value: indianState,
            child: widget.itemBuilder != null
                ? widget.itemBuilder!(indianState)
                : _buildDefaultMenuItem(indianState)))
        .toList();

    return DropdownButton<IndianState>(
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
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedIndianState = value;
            widget.onValuePicked(value);
          });
        }
      },
      items: items,
      value: _selectedIndianState,
      itemHeight: widget.itemHeight,
      selectedItemBuilder: widget.selectedItemBuilder != null
          ? (context) {
              return _indianStates
                  .map((c) => widget.selectedItemBuilder!(c))
                  .toList();
            }
          : null,
    );
  }

  Widget _buildDefaultMenuItem(IndianState indianState) {
    return Row(
      children: <Widget>[
        IndianStatePickerUtils.getStateImage(indianState, 50, 50),
        const SizedBox(
          width: 8.0,
        ),
        Text("(${indianState.code}) +${indianState.population}"),
      ],
    );
  }
}
