import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:reddit_app/ui/screens/registration.dart';
import 'package:reddit_app/ui/screens/home.dart';
//import 'package:reddit_app/ui/screens/thread.dart';
import 'package:reddit_app/ui/screens/login.dart';
import 'package:reddit_app/ui/screens/profile.dart';
import 'package:reddit_app/ui/screens/registration.dart';
import 'package:reddit_app/ui/screens/thread.dart';
import 'package:reddit_app/utils/go_router.dart';
//import 'package:reddit_app/ui/screens/profile.dart';

void main() {
  runApp(RedditApp());
}

class RedditApp extends StatelessWidget {
  RedditApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Reddit App',
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(initialLocation: '/', routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginExample()),
    GoRoute(
        name: RouteNames.home,
        path: '/home',
        builder: (context, state) => const HomePage()),
    GoRoute(
        name: RouteNames.profile,
        path: '/profile',
        builder: (context, state) => const ProfileExample()),
    GoRoute(
        name: RouteNames.thread,
        path: '/thread/:post',
        builder: (context, state) =>
            Thread(post: int.parse(state.pathParameters['post']!))),
    GoRoute(
        name: RouteNames.register,
        path: '/register',
        builder: (context, state) => const Register()),
    GoRoute(
        name: RouteNames.login,
        path: '/login',
        builder: (context, state) => const LoginExample()),
  ]);
}
