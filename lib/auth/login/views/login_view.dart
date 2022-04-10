import 'package:flutter/material.dart';
import 'package:guestay/auth/auth_credentials.dart';
import 'package:guestay/auth/auth_repository.dart';
import 'package:guestay/auth/form_submission_status.dart';
import 'package:guestay/auth/login/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guestay/shared/constants/background.dart';
import 'package:guestay/shared/constants/colours.dart';

import '../../../shared/divider.dart';
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
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: loginBackGroundDecoration,
          child: Column(
            children: [
              SizedBox(height: 200),
              _loginForm(),
              SizedBox(height: 20),
              _loginButton(),
              _signUpButton(context),
              SizedBox(
                height: 20,
              ),
              Text('or sign in with'),
              SizedBox(height: 10),
              _googleLogin(),
              SizedBox(height: 5),
              Text(
                  'By signing in, I agree with Terms of Use and Privacy Policy',
                  style: TextStyle(fontSize: 9))
            ],
          ),
        ),
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: whiteBackground,
            child: Form(
              key: _formKey,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _userEmailField(),
                      textFieldDivider,
                      _passwordField(),
                      SizedBox(height: 12)
                    ],
                  )),
            ),
          ),
        ));
  }

  Widget _userEmailField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Email',
            hintStyle: TextStyle(fontWeight: FontWeight.bold)),
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
          border: InputBorder.none,
          hintText: 'Password',
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
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
          : ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: primaryColor, elevation: 0),
                    onPressed: () {
                      _loginButtonPressed(context);
                    },
                    child: Text('Sign In')),
              ),
            );
    });
  }

  Widget _googleLogin() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formSubmissionStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: whiteBackground, elevation: 0),
                    onPressed: () {
                      _loginButtonPressed(context);
                    },
                    child: Text(
                      'Google',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            );
    });
  }

  void _loginButtonPressed(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginSubmitted());
    }
  }

  Widget _signUpButton(BuildContext context) {
    return TextButton(
      child: Text(
        'Create your account',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () => context
          .read<AuthCubit>()
          .showSignUp(user: context.read<AuthRepository>().user),

      /// smelly
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
