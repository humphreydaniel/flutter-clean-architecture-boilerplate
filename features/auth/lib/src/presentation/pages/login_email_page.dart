import 'package:flutter/material.dart';
import 'package:component/component.dart';
import 'package:preferences/preferences.dart';
import 'package:l10n/l10n.dart';
import 'package:dependencies/dependencies.dart';
import 'package:core/core.dart';

import '../../../auth.dart';

class LoginEmailPage extends StatefulWidget {
  @override
  _LoginEmailPageState createState() => _LoginEmailPageState();
}

class _LoginEmailPageState extends State<LoginEmailPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginBloc _loginBloc = GetIt.I<LoginBloc>();
  bool loadingDialogIsOpen = false;

  @override
  void initState() {
    _addListeners();
    super.initState();
  }

  void _addListeners() {
    _emailController.addListener(() => _onEmailChanged(_emailController.text));
    _passwordController
        .addListener(() => _onPasswordChanged(_passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: Theme(
        data: Theme.of(context).copyWith(
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                iconTheme: IconThemeData(
                  color: Theme.of(context).primaryColor,
                ),
              ),
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              S.current.login,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<LoginBloc, LoginState>(
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
          _onSuccess(state?.user);
        }
      },
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.all(Dimens.dp16),
          physics: BouncingScrollPhysics(),
          children: [
            _buildHeading(),
            SizedBox(height: Dimens.dp24),
            _buildForm(state),
            SizedBox(height: Dimens.dp100),
            _buildButtonCTA(state),
            SizedBox(height: Dimens.dp16),
            _buildActionForgetPassword(),
            SizedBox(height: Dimens.dp16),
          ],
        );
      },
    );
  }

  Widget _buildHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AssetsPath.logo,
          width: 60,
          height: 60,
        ),
        SizedBox(
          height: Dimens.dp32,
        ),
        TitleText(S.current.login_with(S.current.email)),
      ],
    );
  }

  Widget _buildForm(LoginState state) {
    return Column(
      children: [
        RegularInput(
          controller: _emailController,
          prefixIcon: Icons.alternate_email,
          hintText: S.current.email,
          inputType: TextInputType.emailAddress,
          errorText: state.email.invalid
              ? S.current.invalid_input(S.current.email)
              : null,
        ),
        SizedBox(height: Dimens.dp16),
        PasswordInput(
          controller: _passwordController,
          hint: S.current.password,
          errorText: state.password.invalid ? S.current.required_input : null,
        ),
      ],
    );
  }

  Widget _buildActionForgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${S.current.forget_password}?'),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/reset-password');
          },
          child: Text(
            S.current.click_here,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildButtonCTA(LoginState state) {
    return ElevatedButton(
      child: Text(S.current.login),
      onPressed:
          state.status.isValidated && !state.status.isSubmissionInProgress
              ? () {
                  _loginBloc.add(LoginSubmitted());
                  FocusScope.of(context).unfocus();
                }
              : null,
    );
  }

  void _onEmailChanged(String v) {
    _loginBloc.add(LoginEmailChanged(v));
  }

  void _onPasswordChanged(String v) {
    _loginBloc.add(LoginPasswordChanged(v));
  }

  void _dismissDialog() {
    if (loadingDialogIsOpen) {
      Navigator.of(context).pop();
    }

    setState(() {
      loadingDialogIsOpen = false;
    });
  }

  void _onSuccess(UserEntity user) {
    Navigator.of(context).pop(true);
    BlocProvider.of<AuthBloc>(context)..add(AuthLoginEvent(user));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
