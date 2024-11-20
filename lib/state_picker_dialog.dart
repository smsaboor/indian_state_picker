import 'custom_alert_dialog.dart';
import 'package:flutter/material.dart';

typedef ItemFilter<T> = bool Function(T item);
typedef ItemBuilder<T> = Widget Function(T item);
typedef SearchFilter<T> = bool Function(T item, String searchQuery);

/// A dialog for selecting a state or other items.
///
/// The [StatePickerDialog] provides a customizable dialog to display a list
/// of items (such as states) for selection. The dialog supports sorting,
/// filtering, searching, and customizing item rendering.
class StatePickerDialog<T> extends StatefulWidget {
  /// Callback triggered when an item is selected.
  final ValueChanged<T> onValuePicked;

  /// Optional title widget displayed at the top of the dialog.
  final Widget? title;

  /// Padding for the title widget.
  final EdgeInsetsGeometry? titlePadding;

  /// Padding for the content of the dialog.
  final EdgeInsetsGeometry contentPadding;

  /// Semantic label for accessibility.
  final String? semanticLabel;

  /// A filter function to determine which items should be displayed.
  final ItemFilter<T>? itemFilter;

  /// Comparator function for sorting items.
  final Comparator<T>? sortComparator;

  /// A list of items that should appear at the top of the dialog.
  final List<T>? topStates;

  /// A builder function for customizing how each item is displayed.
  final ItemBuilder<T>? itemBuilder;

  /// Divider widget to separate sections in the dialog.
  final Widget divider;

  /// Flag to indicate whether the divider should be shown.
  final bool isDividerEnabled;

  /// Flag to enable or disable the search functionality.
  final bool isSearchable;

  /// Decoration for the search input field.
  final InputDecoration? searchInputDecoration;

  /// Color of the cursor in the search input field.
  final Color? searchCursorColor;

  /// Widget to display when no items match the search query.
  final Widget? searchEmptyView;

  /// Determines whether the dialog should close after an item is picked.
  final bool popOnPick;

  /// Filter function to determine if an item matches the search query.
  final SearchFilter<T>? searchFilter;

  /// List of items to display in the dialog.
  final List<T> states;

  /// Creates a [StatePickerDialog].
  ///
  /// - [onValuePicked] is required and specifies the callback triggered on item selection.
  /// - [states] is required and contains the list of items to display.
  const StatePickerDialog({
    super.key,
    required this.onValuePicked,
    required this.states,
    this.title,
    this.titlePadding,
    this.contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
    this.semanticLabel,
    this.itemFilter,
    this.sortComparator,
    this.topStates,
    this.itemBuilder,
    this.isDividerEnabled = false,
    this.divider = const Divider(height: 0.0),
    this.isSearchable = false,
    this.popOnPick = true,
    this.searchInputDecoration,
    this.searchCursorColor,
    this.searchEmptyView,
    this.searchFilter,
  });

  @override
  StatePickerDialogState<T> createState() => StatePickerDialogState<T>();
}

class StatePickerDialogState<T> extends State<StatePickerDialog<T>> {
  late List<T> _allItems;
  late List<T> _filteredItems;

  @override
  void initState() {
    super.initState();

    // Apply the item filter if provided.
    _allItems = widget.states.where(widget.itemFilter ?? (_) => true).toList();

    // Sort items if a comparator is provided.
    if (widget.sortComparator != null) {
      _allItems.sort(widget.sortComparator);
    }

    // Handle items that should appear at the top.
    if (widget.topStates != null) {
      for (var item in widget.topStates!) {
        _allItems.remove(item);
      }
      _allItems.insertAll(0, widget.topStates!);
    }

    // Initialize the filtered list.
    _filteredItems = _allItems;
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: _buildHeader(),
      contentPadding: widget.contentPadding,
      semanticLabel: widget.semanticLabel,
      content: _buildContent(context),
      isDividerEnabled: widget.isDividerEnabled,
      divider: widget.divider,
    );
  }

  /// Builds the main content of the dialog, including the list of items.
  Widget _buildContent(BuildContext context) {
    return _filteredItems.isNotEmpty
        ? ListView(
      shrinkWrap: true,
      children: _filteredItems
          .map(
            (item) => SimpleDialogOption(
          child: widget.itemBuilder != null
              ? widget.itemBuilder!(item)
              : Text(item.toString()),
          onPressed: () {
            widget.onValuePicked(item);
            if (widget.popOnPick) {
              Navigator.pop(context);
            }
          },
        ),
      )
          .toList(),
    )
        : widget.searchEmptyView ??
        const Center(
          child: Text('No items found.'),
        );
  }

  /// Builds the header of the dialog, which may include a title and search field.
  Widget _buildHeader() {
    return widget.isSearchable
        ? Column(
      children: <Widget>[
        _buildTitle(),
        _buildSearchField(),
      ],
    )
        : _buildTitle();
  }

  /// Builds the title section of the dialog.
  Widget _buildTitle() {
    return widget.titlePadding != null
        ? Padding(
      padding: widget.titlePadding!,
      child: widget.title,
    )
        : widget.title ?? const SizedBox.shrink();
  }

  /// Builds the search input field if search is enabled.
  Widget _buildSearchField() {
    return TextField(
      cursorColor: widget.searchCursorColor,
      decoration: widget.searchInputDecoration ??
          const InputDecoration(hintText: 'Search'),
      onChanged: (String value) {
        setState(() {
          _filteredItems = _allItems.where((item) {
            if (widget.searchFilter != null) {
              return widget.searchFilter!(item, value);
            }
            return item.toString().toLowerCase().contains(value.toLowerCase());
          }).toList();
        });
      },
    );
  }
}
