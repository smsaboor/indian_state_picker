import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:indian_state_picker/indian_state.dart';
import 'package:indian_state_picker/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'indianStates.dart';

class IndianStatePickerDialog extends StatefulWidget {
  final ValueChanged<IndianState> onValuePicked;
  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry contentPadding;
  final String? semanticLabel;
  final ItemFilter? itemFilter;
  final Comparator<IndianState>? sortComparator;
  final List<IndianState>? priorityList;
  final ItemBuilder? itemBuilder;
  final Widget divider;
  final bool isDividerEnabled;
  final bool isSearchable;
  final InputDecoration? searchInputDecoration;
  final Color? searchCursorColor;
  final Widget? searchEmptyView;
  final bool popOnPick;
  final SearchFilter? searchFilter;

  const IndianStatePickerDialog({
    super.key,
    required this.onValuePicked,
    this.title,
    this.titlePadding,
    this.contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
    this.semanticLabel,
    this.itemFilter,
    this.sortComparator,
    this.priorityList,
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
  SingleChoiceDialogState createState() {
    return SingleChoiceDialogState();
  }
}

class SingleChoiceDialogState extends State<IndianStatePickerDialog> {
  late List<IndianState> _allIndianStates;

  late List<IndianState> _filteredIndianStates;

  @override
  void initState() {
    _allIndianStates =
        indianStateList.where(widget.itemFilter ?? acceptAllIndianStates).toList();

    if (widget.sortComparator != null) {
      _allIndianStates.sort(widget.sortComparator);
    }

    if (widget.priorityList != null) {
      for (var indianState in widget.priorityList!) {
        _allIndianStates
          .removeWhere((IndianState c) => indianState.code == c.code);
      }
      _allIndianStates.insertAll(0, widget.priorityList!);
    }

    _filteredIndianStates = _allIndianStates;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyAlertDialog(
      title: _buildHeader(),
      contentPadding: widget.contentPadding,
      semanticLabel: widget.semanticLabel,
      content: _buildContent(context),
      isDividerEnabled: widget.isDividerEnabled,
      divider: widget.divider,
    );
  }

  _buildContent(BuildContext context) {
    return _filteredIndianStates.isNotEmpty
        ? ListView(
            shrinkWrap: true,
            children: _filteredIndianStates
                .map((item) => SimpleDialogOption(
                      child: widget.itemBuilder != null
                          ? widget.itemBuilder!(item)
                          : Text(item.name),
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
              child: Text('No indianState found.'),
            );
  }

  _buildHeader() {
    return widget.isSearchable
        ? Column(
            children: <Widget>[
              _buildTitle(),
              _buildSearchField(),
            ],
          )
        : _buildTitle();
  }

  _buildTitle() {
    return widget.titlePadding != null
        ? Padding(
            padding: widget.titlePadding!,
            child: widget.title,
          )
        : widget.title;
  }

  _buildSearchField() {
    return TextField(
      cursorColor: widget.searchCursorColor,
      decoration:
          widget.searchInputDecoration ?? const InputDecoration(hintText: 'Search'),
      onChanged: (String value) {
        setState(() {
          _filteredIndianStates = _allIndianStates
              .where((IndianState indianState) => widget.searchFilter == null
                  ? indianState.name.toLowerCase().contains(value.toLowerCase()) ||
              indianState.population.startsWith(value.toLowerCase()) ||
              indianState.code
                          .toLowerCase()
                          .startsWith(value.toLowerCase()) ||
              indianState.capital
                          .toLowerCase()
                          .startsWith(value.toLowerCase())
                  : widget.searchFilter!(indianState, value))
              .toList();
        });
      },
    );
  }
}


class MyAlertDialog<T> extends StatelessWidget {
  const MyAlertDialog({
    super.key,
    this.title,
    this.titlePadding,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.actions,
    this.semanticLabel,
    this.divider = const Divider(
      height: 0.0,
    ),
    this.isDividerEnabled = true,
  });
  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final Widget? content;
  final EdgeInsetsGeometry contentPadding;
  final List<Widget>? actions;
  final String? semanticLabel;
  final Widget divider;
  final bool? isDividerEnabled;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    String? label = semanticLabel;

    if (title != null) {
      children.add(Padding(
        padding: titlePadding ??
            EdgeInsets.fromLTRB(
                24.0, 24.0, 24.0, isDividerEnabled == true ? 20.0 : 0.0),
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.titleLarge!,
          child: Semantics(namesRoute: true, child: title),
        ),
      ));
      if (isDividerEnabled == true) children.add(divider);
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          label = semanticLabel;
          break;
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          label = semanticLabel ??
              MaterialLocalizations.of(context).alertDialogLabel;
      }
    }

    if (content != null) {
      children.add(Flexible(
        child: Padding(
          padding: contentPadding,
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.titleMedium!,
            child: content!,
          ),
        ),
      ));
    }

    if (actions != null) {
      if (isDividerEnabled == true) children.add(divider);
      children.add(ButtonBar(
        children: actions!,
      ));
    }

    Widget dialogChild = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );

    if (label != null) {
      dialogChild =
          Semantics(namesRoute: true, label: label, child: dialogChild);
    }

    return Dialog(child: dialogChild);
  }
}