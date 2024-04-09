part of 'alert_bloc.dart';

sealed class AlertEvent extends Equatable {
  const AlertEvent();

  @override
  List<Object> get props => [];
}

final class AlertSubscriptionRequested extends AlertEvent {
  const AlertSubscriptionRequested();
}

final class AlertToggleExpansion extends AlertEvent {
  const AlertToggleExpansion();
}

final class AlertButtonPressed extends AlertEvent {
  const AlertButtonPressed(this.buttonIndex);

  final int buttonIndex;
}
