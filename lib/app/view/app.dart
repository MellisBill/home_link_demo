import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_link_interview/home/home.dart';
import 'package:home_link_interview/repos/alerts_repository.dart';
import 'package:home_link_interview/theme/theme.dart';

class App extends StatelessWidget {
  const App({
    required this.alertsRepository,
    super.key,
  });

  final AlertsRepository alertsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: alertsRepository,
      child: const AppView(),
    );
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
