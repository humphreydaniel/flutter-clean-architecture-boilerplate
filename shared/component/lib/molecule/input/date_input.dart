import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component.dart';

import 'regular_input.dart';

class DateInput extends StatelessWidget {
  final DateFormat format;
  final String label;
  final String hintText;
  final String errorText;
  final DateTime value;
  final FocusNode focusNode;
  final ValueChanged<DateTime> onChanged;
  final DateTime minimumDate;
  final DateTime maximumDate;

  const DateInput({
    Key key,
    this.format,
    this.label,
    this.hintText,
    this.errorText,
    this.value,
    this.focusNode,
    @required this.onChanged,
    this.minimumDate,
    this.maximumDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegularInput(
      readOnly: true,
      label: label,
      hintText: hintText,
      controller: value != null
          ? TextEditingController(
              text: (format ?? DateFormat('dd-MM-yyyy')).format(value),
            )
          : null,
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => ContentSheet(
              height: 320,
              content: CupertinoTheme(
                data: CupertinoThemeData(
                    brightness: Theme.of(context).brightness,
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle:
                          Theme.of(context).textTheme.headline6.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                    )),
                child: CupertinoDatePicker(
                  onDateTimeChanged: onChanged,
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: value,
                  maximumDate: maximumDate ?? DateTime(2100, 01),
                  minimumDate: minimumDate ?? DateTime(1900, 01),
                ),
              )),
        );
      },
      focusNode: focusNode,
      errorText: errorText,
    );
  }
}
