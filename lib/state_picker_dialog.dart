import 'custom_alert_dialog.dart';
import 'package:flutter/material.dart';

typedef ItemFilter<T> = bool Function(T item);
typedef ItemBuilder<T> = Widget Function(T item);
typedef SearchFilter<T> = bool Function(T item, String searchQuery);

class StatePickerDialog<T> extends StatefulWidget {
  final ValueChanged<T> onValuePicked;
  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry contentPadding;
  final String? semanticLabel;
  final ItemFilter<T>? itemFilter;
  final Comparator<T>? sortComparator;
  final List<T>? topStates;
  final ItemBuilder<T>? itemBuilder;
  final Widget divider;
  final bool isDividerEnabled;
  final bool isSearchable;
  final InputDecoration? searchInputDecoration;
  final Color? searchCursorColor;
  final Widget? searchEmptyView;
  final bool popOnPick;
  final SearchFilter<T>? searchFilter;
  final List<T> states;

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
    this.divider = const Divider(
      height: 0.0,
    ),
    this.isSearchable = false,
    this.popOnPick = true,
    this.searchInputDecoration,
    this.searchCursorColor,
    this.searchEmptyView,
    this.searchFilter,
  });

  @override
  _StatePickerDialogState<T> createState() => _StatePickerDialogState<T>();
}

class _StatePickerDialogState<T> extends State<StatePickerDialog<T>> {
  late List<T> _allItems;
  late List<T> _filteredItems;

  @override
  void initState() {
    _allItems =
        widget.states.where(widget.itemFilter ?? (_) => true).toList();

    if (widget.sortComparator != null) {
      _allItems.sort(widget.sortComparator);
    }

    if (widget.topStates != null) {
      for (var item in widget.topStates!) {
        _allItems.remove(item);
      }
      _allItems.insertAll(0, widget.topStates!);
    }

    _filteredItems = _allItems;

    super.initState();
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

  Widget _buildContent(BuildContext context) {
    return _filteredItems.isNotEmpty
        ? ListView(
      shrinkWrap: true,
      children: _filteredItems
          .map((item) => SimpleDialogOption(
        child: widget.itemBuilder != null
            ? widget.itemBuilder!(item)
            : Text(item.toString()),
        onPressed: () {
          widget.onValuePicked(item);
          if (widget.popOnPick) {
            Navigator.pop(context);
          }
        },
      ))
          .toList(),
    )
        : widget.searchEmptyView ??
        const Center(
          child: Text('No items found.'),
        );
  }

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

  Widget _buildTitle() {
    return widget.titlePadding != null
        ? Padding(
      padding: widget.titlePadding!,
      child: widget.title,
    )
        : widget.title ?? const SizedBox.shrink();
  }

  Widget _buildSearchField() {
    return TextField(
      cursorColor: widget.searchCursorColor,
      decoration:
      widget.searchInputDecoration ?? const InputDecoration(hintText: 'Search'),
      onChanged: (String value) {
        setState(() {
          _filteredItems = _allItems.where((item) {
            if (widget.searchFilter != null) {
              return widget.searchFilter!(item, value);
            }
            print("object== ${item?.toString().toLowerCase()}");
            return item.toString().toLowerCase().contains(value.toLowerCase());
          }).toList();
        });
      },
    );
  }
}
