import 'package:component/component.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';

import '../../../auth.dart';
import '../component/component.dart';

class RegisterEmailPage extends StatefulWidget {
  @override
  _RegisterEmailPageState createState() => _RegisterEmailPageState();
}

class _RegisterEmailPageState extends State<RegisterEmailPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final RegisterBloc _registerBloc = GetIt.I<RegisterBloc>();
  bool loadingDialogIsOpen = false;
  bool isAcceptTermCondition = false;

  @override
  void initState() {
    _addListeners();
    super.initState();
  }

  void _addListeners() {
    _nameController.addListener(() => _onNameChanged(_nameController.text));
    _emailController.addListener(() => _onEmailChanged(_emailController.text));
    _passwordController
        .addListener(() => _onPasswordChanged(_passwordController.text));
    _confirmPasswordController.addListener(
        () => _onConfirmPasswordChanged(_confirmPasswordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _registerBloc,
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
              S.current.register,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<RegisterBloc, RegisterState>(
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
            SizedBox(height: Dimens.dp20),
            _buildTermCondition(),
            SizedBox(height: Dimens.dp40),
            _buildButtonCTA(state),
            SizedBox(height: Dimens.dp12),
            _buildActionToLogin(),
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
        TitleText(S.current.register_with(S.current.email)),
      ],
    );
  }

  Widget _buildForm(RegisterState state) {
    return Column(
      children: [
        RegularInput(
          controller: _nameController,
          prefixIcon: Icons.person_outline,
          hintText: S.current.full_name,
          inputType: TextInputType.emailAddress,
          errorText: state.name.invalid ? S.current.required_input : null,
        ),
        SizedBox(height: Dimens.dp16),
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
        SizedBox(height: Dimens.dp16),
        PasswordInput(
          controller: _confirmPasswordController,
          hint: S.current.confirm_password,
          errorText: state.password.invalid ? S.current.required_input : null,
        ),
      ],
    );
  }

  Widget _buildTermCondition() {
    return Row(
      children: [
        Checkbox(
          value: isAcceptTermCondition,
          onChanged: (v) {
            setState(() {
              isAcceptTermCondition = v;
            });
          },
        ),
        SizedBox(width: Dimens.dp16),
        Expanded(
          child: TermConditionText(
            align: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonCTA(RegisterState state) {
    return ElevatedButton(
      child: Text(S.current.register),
      onPressed:
          state.status.isValidated && !state.status.isSubmissionInProgress
              ? () {
                  _registerBloc.add(RegisterSubmitted());
                  FocusScope.of(context).unfocus();
                }
              : null,
    );
  }

  Widget _buildActionToLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.current.question_already_have_account,
          style: TextStyle(
            fontSize: Dimens.dp10,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text(
            S.current.click_here,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: Dimens.dp10,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  void _onNameChanged(String v) {
    _registerBloc.add(RegisterNameChanged(v));
  }

  void _onEmailChanged(String v) {
    _registerBloc.add(RegisterEmailChanged(v));
  }

  void _onPasswordChanged(String v) {
    _registerBloc.add(RegisterPasswordChanged(v));
  }

  void _onConfirmPasswordChanged(String v) {
    _registerBloc.add(RegisterPasswordChanged(v));
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
    Navigator.of(context).pop();
    Navigator.of(context).pop(true);
    BlocProvider.of<AuthBloc>(context)..add(AuthLoginEvent(user));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
