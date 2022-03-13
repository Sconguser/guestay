import 'package:flutter/material.dart';
import 'package:guestay/auth/auth_credentials.dart';
import 'package:guestay/auth/auth_repository.dart';
import 'package:guestay/auth/form_submission_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth_cubit.dart';
import '../sign_up_bloc.dart';
import '../sign_up_event.dart';
import '../sign_up_state.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final int passwordLength = 6;
  final String incorrectEmail = 'Please enter valid email';
  final String incorrectPassword = 'Password has to be 6 characters or longer';
  final String incorrectPasswordConfirmation = 'Passwords do not match';
  final String incorrectUsername = 'Username has to be 6 characters or longer';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpBloc(
            authRepository: context.read<AuthRepository>(),
            authCubit: context.read<AuthCubit>()),
        child: Stack(
            alignment: Alignment.bottomCenter,
            children: [_signUpForm(), _loginButton(context)]),
      ),
    );
  }

  Widget _signUpForm() {
    return BlocListener<SignUpBloc, SignUpState>(
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
                  _userUsernameField(),
                  _userNameField(),
                  _userLastNameField(),
                  _userEmailField(),
                  _userPasswordField(),
                  _userPasswordConfirmationField(),
                  _signUpButton(),
                ],
              )),
        ));
  }

  Widget _userUsernameField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(
            icon: Icon(Icons.person), hintText: 'Username'),
        validator: (value) => state.isValidUsername ? null : incorrectUsername,
        onChanged: (value) => context
            .read<SignUpBloc>()
            .add(SignUpUsernameChanged(userUsername: value)),
      );
    });
  }

  Widget _userNameField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        decoration:
            const InputDecoration(icon: Icon(Icons.person), hintText: 'Name'),
        validator: (value) => state.isValidUserEmail ? null : incorrectEmail,
        onChanged: (value) =>
            context.read<SignUpBloc>().add(SignUpNameChanged(userName: value)),
      );
    });
  }

  Widget _userLastNameField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(
            icon: Icon(Icons.person), hintText: 'Last name'),
        onChanged: (value) => context
            .read<SignUpBloc>()
            .add(SignUpLastNameChanged(userLastName: value)),
      );
    });
  }

  Widget _userEmailField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        decoration:
            const InputDecoration(icon: Icon(Icons.person), hintText: 'Email'),
        onChanged: (value) => context
            .read<SignUpBloc>()
            .add(SignUpEmaiLChanged(userEmail: value)),
      );
    });
  }

  Widget _userPasswordField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
            icon: Icon(Icons.security), hintText: 'Password'),
        validator: (value) => state.isValidPassword ? null : incorrectPassword,
        onChanged: (value) => context
            .read<SignUpBloc>()
            .add(SignUpPasswordChanged(userPassword: value)),
      );
    });
  }

  Widget _userPasswordConfirmationField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
            icon: Icon(Icons.security), hintText: 'Confirm password'),
        validator: (value) => state.isValidPasswordConfirmation
            ? null
            : incorrectPasswordConfirmation,
        onChanged: (value) => context.read<SignUpBloc>().add(
            SignUpPasswordConfirmationChanged(userPasswordConfirmation: value)),
      );
    });
  }

  Widget _signUpButton() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return state.formSubmissionStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                _signUpButtonPressed(context);
              },
              child: Text('Sign Up!'));
    });
  }

  void _signUpButtonPressed(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      context.read<SignUpBloc>().add(SignUpSubmitted());
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _loginButton(BuildContext context) {
    return SafeArea(
        child: TextButton(
            onPressed: () => context
                .read<AuthCubit>()
                .showLogin(user: context.read<AuthRepository>().user),
            child: Text('Already have an account? Sign in.')));
  }
}
