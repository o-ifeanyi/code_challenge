import 'package:code_challenge/core/constants/constants.dart';
import 'package:code_challenge/core/util/config.dart';
import 'package:flutter/material.dart';

import 'action_button.dart';

class CustomField extends StatefulWidget {
  const CustomField({
    Key? key,
    required this.title,
    required this.items,
    required this.onSelect,
  }) : super(key: key);

  final String title;
  final JsonMap items;
  final Function(String value) onSelect;

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.items.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        if (widget.title.isNotEmpty)
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: Config.b2(context),
          ),
        SizedBox(height: Config.yMargin(context, 2)),
        RoundedBox(
          color: theme.backgroundColor,
          child: DropdownButton<String>(
            value: _selectedValue,
            alignment: AlignmentDirectional.center,
            underline: const SizedBox.shrink(),
            icon: const SizedBox.shrink(),
            items: widget.items.keys
                .map(
                  (e) => DropdownMenuItem<String>(
                    key: ValueKey(e),
                    alignment: AlignmentDirectional.center,
                    value: e,
                    child: Text(e, style: Config.b1(context)),
                  ),
                )
                .toList(),
            onChanged: (String? val) {
              setState(() {
                if (val != null) {
                  _selectedValue = val;
                  widget.onSelect(widget.items[val]);
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
