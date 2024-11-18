import 'package:flutter/material.dart';


class CustomAlertDialog extends StatelessWidget {
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

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
