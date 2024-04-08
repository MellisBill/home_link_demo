import 'package:flutter/material.dart';
import 'package:home_link_interview/home/home.dart';
import 'package:home_link_interview/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: HomeLinkTheme.light,
      home: const HomePage(),
    );
  }
}
