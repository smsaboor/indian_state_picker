import 'package:flutter/material.dart';

/// A custom implementation of an AlertDialog with flexible configuration options.
class CustomAlertDialog extends StatelessWidget {
  /// Creates a [CustomAlertDialog].
  ///
  /// [title] is the widget displayed at the top of the dialog, often used for headings.
  /// [titlePadding] specifies custom padding for the title widget.
  /// [content] is the widget displayed as the body of the dialog.
  /// [contentPadding] provides padding around the content widget, defaulting to 24dp.
  /// [actions] is a list of widgets displayed at the bottom, often for buttons.
  /// [semanticLabel] provides an accessibility label for the dialog.
  /// [divider] allows customization of the divider widget between sections.
  /// [isDividerEnabled] controls whether the divider is displayed.
  const CustomAlertDialog({
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

  /// Widget displayed as the dialog's title.
  final Widget? title;

  /// Custom padding for the [title] widget.
  final EdgeInsetsGeometry? titlePadding;

  /// Widget displayed as the content of the dialog.
  final Widget? content;

  /// Padding applied to the [content] widget.
  final EdgeInsetsGeometry contentPadding;

  /// List of widgets displayed as actions, such as buttons.
  final List<Widget>? actions;

  /// Accessibility label for the dialog.
  final String? semanticLabel;

  /// Customizable divider widget displayed between sections.
  final Widget divider;

  /// Flag indicating whether the divider is enabled.
  final bool? isDividerEnabled;

  @override
  Widget build(BuildContext context) {
    // List of child widgets to be added to the dialog.
    final List<Widget> children = <Widget>[];

    // Add title if provided.
    if (title != null) {
      children.add(
        Padding(
          padding: titlePadding ??
              EdgeInsets.fromLTRB(
                24.0,
                24.0,
                24.0,
                isDividerEnabled == true ? 20.0 : 0.0,
              ),
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.titleLarge!,
            child: Semantics(
              namesRoute: true, // Indicates a named route for accessibility.
              child: title,
            ),
          ),
        ),
      );

      // Add divider if enabled.
      if (isDividerEnabled == true) children.add(divider);
    }

    // Add content if provided.
    if (content != null) {
      children.add(
        Flexible(
          child: Padding(
            padding: contentPadding,
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.titleMedium!,
              child: content!,
            ),
          ),
        ),
      );
    }

    // Add actions if provided.
    if (actions != null) {
      if (isDividerEnabled == true) children.add(divider);

      // Use a ButtonBar to arrange action buttons.
      children.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the end
          children: actions!,
        ),
      );
    }

    // Return the dialog widget with its children.
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Makes the dialog wrap its content.
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Stretches children horizontally.
        children: children,
      ),
    );
  }
}

