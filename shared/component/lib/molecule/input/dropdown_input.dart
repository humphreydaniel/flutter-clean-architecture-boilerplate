import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class DropdownInput extends StatelessWidget {
  final ValueChanged<String> onChange;
  final String value;
  final List<String> items;
  final String label;
  final String hint;
  final String errorText;
  final IconData prefixIcon;
  final List<DropdownMenuItem<String>> customItems;

  const DropdownInput({
    Key key,
    @required this.onChange,
    @required this.value,
    @required this.items,
    this.label,
    this.hint,
    this.errorText,
    this.prefixIcon,
    this.customItems,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(fontWeight: FontWeight.normal),
            errorText: errorText,
            hintText: hint,
            prefixIcon:
                prefixIcon != null ? Icon(prefixIcon, size: Dimens.dp20) : null,
            contentPadding: EdgeInsets.symmetric(horizontal: Dimens.dp16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(Dimens.dp8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(Dimens.dp8),
            ),
          ),
          isEmpty: value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isDense: true,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: Dimens.dp14),
              hint: Text(hint ?? ''),
              onChanged: onChange,
              items: (customItems != null && customItems.isNotEmpty)
                  ? customItems
                  : items.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
            ),
          ),
        );
      },
    );
  }
}
