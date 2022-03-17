import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

import '../../../settings.dart';
import '../../domain/entities/country_entity.dart';

class SettingLanguagePage extends StatefulWidget {
  @override
  _SettingLanguagePageState createState() => _SettingLanguagePageState();
}

class _SettingLanguagePageState extends State<SettingLanguagePage> {
  Country _currentLang;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        if (state is LanguageState) {
          _currentLang = state.country;
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.change_language),
          ),
          body: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: Dimens.dp16),
      child: Column(
        children:
            CountryData.supportedLanguageCountry.map(_buildItemCard).toList(),
      ),
    );
  }

  Widget _buildItemCard(Country lang) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: ListTile(
        title: Text(lang.name),
        onTap: () => _onChangeLanguage(lang),
        leading: _buildLeadingItem(lang == _currentLang, lang.flag),
      ),
    );
  }

  Widget _buildLeadingItem(bool isActive, String image) {
    if (isActive) {
      return Icon(Icons.check, color: StaticColors.green);
    }

    return Image.asset(image, width: Dimens.dp24);
  }

  void _onChangeLanguage(Country lang) {
    if (_currentLang != lang) {
      _showConfirmDialog(lang);
    }
  }

  void _showConfirmDialog(Country lang) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(
          S.current.confirm_to_change_lang(lang.name),
        ),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(S.current.cancel),
          ),
          FlatButton(
            onPressed: () {
              _setLangApp(lang);
            },
            child: Text(S.current.ok),
          ),
        ],
      ),
    );
  }

  void _setLangApp(Country lang) {
    context.read<LanguageBloc>().add(ChangeLanguageEvent(lang));
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}
