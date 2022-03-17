import 'package:flutter/material.dart';
import 'package:component/component.dart';
import 'package:preferences/preferences.dart';
import 'package:l10n/l10n.dart';
import 'package:dependencies/dependencies.dart';
import 'package:core/core.dart';

import '../../../auth.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  final ResetPasswordBloc _resetPasswordBloc = GetIt.I<ResetPasswordBloc>();
  bool loadingDialogIsOpen = false;
  bool isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _resetPasswordBloc,
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
              S.current.forget_password,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: isSuccess ? _SuccessContent() : _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          setState(() {
            loadingDialogIsOpen = true;
          });
          IndicatorsUtils.showDialogLoading(context).whenComplete(() {
            setState(() {
              loadingDialogIsOpen = false;
            });
          });
        } else if (state is ResetPasswordFailure) {
          _dismissDialog();
          IndicatorsUtils.showErrorSnackBar(
              context, state?.failure?.message ?? '');
        } else if (state is ResetPasswordSuccess) {
          _dismissDialog();
          _onSuccess();
        }
      },
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.all(Dimens.dp16),
          physics: BouncingScrollPhysics(),
          children: [
            _buildHeading(),
            SizedBox(height: Dimens.dp40),
            _buildForm(state),
            SizedBox(height: Dimens.dp40),
            _buildButtonCTA(state),
          ],
        );
      },
    );
  }

  Widget _buildHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(S.current.reset_password),
        SizedBox(
          height: Dimens.dp10,
        ),
        SubTitleText(
          S.current.reset_password_commands,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: Dimens.dp12,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(ResetPasswordState state) {
    return Column(
      children: [
        RegularInput(
          controller: _emailController,
          prefixIcon: Icons.alternate_email,
          hintText: S.current.email,
          inputType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget _buildButtonCTA(ResetPasswordState state) {
    return ElevatedButton(
      child: Text(S.current.reset_password),
      onPressed: () {
        _resetPasswordBloc.add(GetResetPasswordEvent(_emailController.text));
        FocusScope.of(context).unfocus();
        setState(() {
          isSuccess = true;
        });
      },
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

  void _onSuccess() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          S.current.reset_password,
        ),
        content: Text(
          S.current.message_success_reset_password,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        actions: [
          FlatButton(
            child: Text(S.current.ok),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}

class _SuccessContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IllustrationMessage(
        imagePath: AssetsPath.successResetPassIllustration,
        title: S.current.title_success_reset_pass,
        message: S.current.desc_success_reset_pass,
      ),
    );
  }
}
