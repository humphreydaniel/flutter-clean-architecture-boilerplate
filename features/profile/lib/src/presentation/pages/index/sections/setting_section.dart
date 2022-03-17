import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/settings.dart';

class SettingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.style),
          title: Text('Dark Mode'),
          trailing: Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (isDark) {
              if (isDark) {
                BlocProvider.of<ThemeBloc>(context)
                    .add(ChangeThemeEvent(theme: AppTheme.greenDark));
              } else {
                BlocProvider.of<ThemeBloc>(context)
                    .add(ChangeThemeEvent(theme: AppTheme.greenLight));
              }
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text(S.current.change_language),
          onTap: () => _showDialogSettingLanguage(context),
        ),
      ],
    );
  }

  void _showDialogSettingLanguage(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(S.current.change_language),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: CountryData.supportedLanguageCountry
                    .map(
                      (e) => ListTile(
                        title: Text(e?.name ?? ''),
                        onTap: () {
                          BlocProvider.of<LanguageBloc>(context)
                              .add(ChangeLanguageEvent(e));
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                    .toList(),
              ),
            ));
  }
}
