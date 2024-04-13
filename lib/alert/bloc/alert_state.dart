part of 'alert_bloc.dart';

enum AlertStatus { initial, loading, success, failure }

final class AlertState extends Equatable {
  const AlertState({
    this.status = AlertStatus.initial,
    this.alerts = const [],
    this.isExpanded = false,
    this.isResolving = false,
    this.isResolved = false,
    this.lastPressedButtonIndex,
  });

  final AlertStatus status;
  final List<Alert> alerts;
  final bool isExpanded;
  final bool isResolved;
  final bool isResolving;
  final int? lastPressedButtonIndex;

  AlertState copyWith(
      {AlertStatus Function()? status,
      List<Alert> Function()? alerts,
      bool? isExpanded,
      bool? isResolving,
      bool? isResolved,
      int? lastPressedButtonIndex,}) {
    return AlertState(
      status: status != null ? status() : this.status,
      alerts: alerts != null ? alerts() : this.alerts,
      isExpanded: isExpanded ?? this.isExpanded,
      isResolving: isResolving ?? this.isResolving,
      isResolved: isResolved ?? this.isResolved,
      lastPressedButtonIndex: lastPressedButtonIndex,
    );
  }

  @override
  List<Object?> get props => [
        status,
        alerts,
        isExpanded,
        isResolving,
        isResolved,
        lastPressedButtonIndex,
      ];
}

final class AlertInitial extends AlertState {}
