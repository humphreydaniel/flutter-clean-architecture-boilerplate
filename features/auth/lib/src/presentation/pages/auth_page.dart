import 'package:component/component.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';

import '../../../auth.dart';
import '../component/component.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _loginBloc = GetIt.I<LoginBloc>();
  bool loadingDialogIsOpen = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionInProgress) {
          setState(() {
            loadingDialogIsOpen = true;
          });
          IndicatorsUtils.showDialogLoading(context).whenComplete(() {
            setState(() {
              loadingDialogIsOpen = false;
            });
          });
        } else if (state.status.isSubmissionFailure) {
          _dismissDialog();
          IndicatorsUtils.showErrorSnackBar(
              context, state?.failure?.message ?? '');
        } else if (state.status.isSubmissionSuccess) {
          _dismissDialog();
          BlocProvider.of<AuthBloc>(context)..add(AuthLoginEvent(state.user));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: Dimens.height(context) * 0.1,
            ),
            _buildLogo(),
            const SizedBox(height: Dimens.dp32),
            _buildMessage(),
            const Spacer(),
            _buildLoginButton(),
            const SizedBox(height: Dimens.dp24),
            const TermConditionText(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      AssetsPath.logo,
      width: Dimens.dp100,
      height: Dimens.dp100,
    );
  }

  Widget _buildMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SubTitleText(
          S.current.welcome_in,
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: Dimens.dp8),
        HeadingText(GetIt.I<GlobalConfiguration>().getValue('app_name')),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          child: Text(S.current.login),
          onPressed: _showLoginSheet,
        ),
        SizedBox(height: Dimens.dp8),
        OutlinedButton(
          child: Text(S.current.register),
          onPressed: _showRegisterSheet,
        ),
      ],
    );
  }

  Widget _buildBodySheet(Widget buttons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleText('${S.current.welcome_in} '
            '${GetIt.I<GlobalConfiguration>().getValue('app_name')}'),
        const SizedBox(height: Dimens.dp4),
        RegularText(S.current.select_login_message),
        SizedBox(height: Dimens.dp24),
        buttons,
        const SizedBox(height: Dimens.dp24),
        const TermConditionText(),
        const SizedBox(height: Dimens.dp16),
      ],
    );
  }

  Widget _buildLoginButtonSocial() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SocialButton(
          icon: AssetsPath.google,
          text: S.current.login_with('Google'),
          onPressed: () {
            Navigator.of(context).pop();
            _loginBloc.add(LoginGoogleSubmitted());
          },
        ),
        SizedBox(height: Dimens.dp8),
        SocialButton(
          icon: AssetsPath.apple,
          text: S.current.login_with('Apple'),
          onPressed: () {},
        ),
        SizedBox(height: Dimens.dp8),
        SocialButton(
          icon: AssetsPath.email,
          text: S.current.login_with(S.current.email),
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/login');
          },
        ),
      ],
    );
  }

  Widget _buildRegisterButtonSocial() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SocialButton(
          icon: AssetsPath.google,
          text: S.current.register_with('Google'),
          onPressed: () {
            Navigator.of(context).pop();
            _loginBloc.add(LoginGoogleSubmitted());
          },
        ),
        SizedBox(height: Dimens.dp8),
        SocialButton(
          icon: AssetsPath.apple,
          text: S.current.register_with('Apple'),
          onPressed: () {},
        ),
        SizedBox(height: Dimens.dp8),
        SocialButton(
          icon: AssetsPath.email,
          text: S.current.register_with(S.current.email),
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/register');
          },
        ),
      ],
    );
  }

  void _showLoginSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ContentSheet(
        expandContent: false,
        content: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.dp16),
          child: _buildBodySheet(_buildLoginButtonSocial()),
        ),
      ),
    );
  }

  void _showRegisterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ContentSheet(
        expandContent: false,
        content: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.dp16),
          child: _buildBodySheet(_buildRegisterButtonSocial()),
        ),
      ),
    );
  }

  void _dismissDialog() {
    if (loadingDialogIsOpen) {
      Navigator.of(context).pop();
    }

    setState(() {
      loadingDialogIsOpen = false;
    });
  }
}
