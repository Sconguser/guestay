import 'package:flutter/material.dart';
import 'package:guestay/auth/auth_credentials.dart';
import 'package:guestay/auth/auth_repository.dart';
import 'package:guestay/auth/form_submission_status.dart';
import 'package:guestay/auth/login/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth_cubit.dart';
import '../login_bloc.dart';
import '../login_state.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final int passwordLength = 6;
  final String incorrectEmail = 'Please enter valid email';
  final String incorrectPassword = 'Please enter valid password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
            authRepository: context.read<AuthRepository>(),
            authCubit: context.read<AuthCubit>()),
        child: Stack(
            alignment: Alignment.bottomCenter,
            children: [_loginForm(), _signUpButton(context)]),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final formStatus = state.formSubmissionStatus;
          if (formStatus is SubmissionFailed) {
            _showSnackBar(context, formStatus.exception.toString());
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _userEmailField(),
                  _passwordField(),
                  _loginButton(),
                ],
              )),
        ));
  }

  Widget _userEmailField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration:
            const InputDecoration(icon: Icon(Icons.person), hintText: 'Email'),
        validator: (value) => state.isValidUserEmail ? null : incorrectEmail,
        onChanged: (value) => context
            .read<LoginBloc>()
            .add(LoginUserEmailChanged(userEmail: value)),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(
            icon: Icon(Icons.security), hintText: 'Password'),
        validator: (value) => state.isValidPassword ? null : incorrectPassword,
        onChanged: (value) => context
            .read<LoginBloc>()
            .add(LoginPasswordChanged(password: value)),
      );
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formSubmissionStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                _loginButtonPressed(context);
              },
              child: Text('Login'));
    });
  }

  void _loginButtonPressed(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginSubmitted());
    }
  }

  Widget _signUpButton(BuildContext context) {
    return SafeArea(
        child: TextButton(
      child: Text('Sign up'),
      onPressed: () => context
          .read<AuthCubit>()
          .showSignUp(user: context.read<AuthRepository>().user),

      /// smelly
    ));
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
