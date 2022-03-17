import 'package:flutter/material.dart';

import 'regular_input.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final String errorText;
  const PasswordInput({
    Key key,
    this.controller,
    this.hint,
    this.errorText,
    this.label,
  }) : super(key: key);
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return RegularInput(
      errorText: widget.errorText,
      controller: widget.controller,
      hintText: widget.hint,
      label: widget.label,
      prefixIcon: Icons.lock_outline,
      inputType: TextInputType.visiblePassword,
      obscureText: !isVisible,
      suffix: _buildSuffix(),
    );
  }

  Widget _buildSuffix() {
    return InkWell(
      child: Icon(isVisible
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined),
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
    );
  }
}
