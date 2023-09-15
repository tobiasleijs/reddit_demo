import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reddit_app/utils/go_router.dart';

class ScaffoldFooter extends StatelessWidget {
  const ScaffoldFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF499167),
      selectedItemColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ],
      onTap: (value) {
        if (value == 0) {
          context.goNamed(RouteNames.home);
        } else if (value == 1) {
          context.goNamed(RouteNames.postCreation);
        } else if (value == 2) {
          context.goNamed(RouteNames.profile);
        }
      },
    );
  }
}
