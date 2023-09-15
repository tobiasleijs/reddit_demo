import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:reddit_app/persistence/persistence_adapter.dart';
import 'package:reddit_app/persistence/persistence_port.dart';
import 'package:reddit_app/ui/screens/home.dart';
import 'package:reddit_app/utils/go_router.dart';
import 'package:reddit_app/utils/user_simple_preferences.dart';

final loginOptions = LoginOptions(
  emailDecoration: const InputDecoration(
    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(),
  ),
  passwordDecoration: const InputDecoration(
    prefixIcon: Icon(Icons.password),
    border: OutlineInputBorder(),
  ),
  title: const Text('Login'),
  image: Image.asset('assets/reddit_clone.png', height: 300.0),
  // requestForgotPasswordButtonBuilder: (context, onPressed, isDisabled) {
  //   return Opacity(
  //     opacity: isDisabled ? 0.5 : 1.0,
  //     child: ElevatedButton(
  //       onPressed: onPressed,
  //       child: const Text('Send request'),
  //     ),
  //   );
  // },
);

class LoginExample extends StatelessWidget {
  const LoginExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final PersistencePort database = PersistenceAdapter();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmailPasswordLoginForm(
        options: loginOptions,
        onLogin: (email, password) async {
          if (database.loginUser(email, password) != null) {
            await UserSimplePreferences.loginUser(
                database.loginUser(email, password)!);
            context.pushReplacementNamed(RouteNames.home);
          }
        },
        onRegister: (email, password) {},
        onForgotPassword: (email) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const ForgotPasswordScreen();
              },
            ),
          );
        },
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ForgotPasswordForm(
        options: loginOptions,
        title: const Text('Forgot password'),
        description: const Text('Hello world'),
        onRequestForgotPassword: (email) {},
      ),
    );
  }
}
