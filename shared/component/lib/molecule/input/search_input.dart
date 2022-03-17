import 'package:flutter/material.dart';

import '../../component.dart';

class SearchTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback onClear;
  final ValueChanged<String> onChanged;
  final bool readOnly;
  final VoidCallback onTap;
  final FocusNode focusNode;

  const SearchTextInput({
    Key key,
    @required this.controller,
    this.hint,
    this.onClear,
    this.onChanged,
    this.readOnly,
    this.onTap,
    this.focusNode,
  })  : assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegularInput(
      hintText: hint,
      focusNode: focusNode,
      controller: controller,
      prefixIcon: Icons.search,
      onChange: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      suffix: (controller?.text ?? '').isNotEmpty
          ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller?.clear();
                if (onClear != null) {
                  onClear();
                }
              },
            )
          : null,
    );
  }
}
