import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_link_interview/repos/alerts_repository.dart';

part 'alerts_summary_event.dart';
part 'alerts_summary_state.dart';

class AlertsSummaryBloc extends Bloc<AlertsSummaryEvent, AlertsSummaryState> {
  AlertsSummaryBloc({
    required AlertsRepository alertsRepository,
  })  : _alertsRepository = alertsRepository,
        super(const AlertsSummaryState()) {
    on<AlertsSummarySubscriptionRequested>(_onSubscriptionRequested);
  }

  final AlertsRepository _alertsRepository;

  Future<void> _onSubscriptionRequested(
    AlertsSummarySubscriptionRequested event,
    Emitter<AlertsSummaryState> emit,
  ) async {
    emit(state.copyWith(status: () => AlertsSummaryStatus.loading));

    await emit.forEach<List<Alert>>(
      _alertsRepository.getAlerts(),
      onData: (alerts) => state.copyWith(
        status: () => AlertsSummaryStatus.success,
        alerts: () => alerts,
      ),
      onError: (_, __) => state.copyWith(
        status: () => AlertsSummaryStatus.failure,
      ),
    );
  }
}
