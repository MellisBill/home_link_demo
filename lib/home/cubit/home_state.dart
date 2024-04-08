part of 'home_cubit.dart';

enum HomeTab { alert, alert_summary }

final class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.alert,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
