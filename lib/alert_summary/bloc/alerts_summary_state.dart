part of 'alerts_summary_bloc.dart';

enum AlertsSummaryStatus { initial, loading, success, failure }

final class AlertsSummaryState extends Equatable {
  const AlertsSummaryState({
    this.status = AlertsSummaryStatus.initial,
    this.alerts = const [],
  });

  final AlertsSummaryStatus status;
  final List<Alert> alerts;

  AlertsSummaryState copyWith({
    AlertsSummaryStatus Function()? status,
    List<Alert> Function()? alerts,
  }) {
    return AlertsSummaryState(
      status: status != null ? status() : this.status,
      alerts: alerts != null ? alerts() : this.alerts,
    );
  }

  @override
  List<Object?> get props => [
        status,
        alerts,
      ];
}
