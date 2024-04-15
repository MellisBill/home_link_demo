import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:home_link_interview/app/app.dart';
import 'package:home_link_interview/repos/alerts_repository.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  //Documenting any changes within program
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  //Documenting any errors outputted in program
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final alertsRepository = AlertsRepository();

    runZonedGuarded(
    () => runApp(App(alertsRepository: alertsRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
