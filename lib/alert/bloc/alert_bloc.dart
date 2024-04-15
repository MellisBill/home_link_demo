import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_link_interview/models/alert.dart';
import 'package:home_link_interview/repos/alerts_repository.dart';

part 'alert_event.dart';
part 'alert_state.dart';

class AlertBloc extends Bloc<AlertEvent, AlertState> {
  AlertBloc({
    required AlertsRepository alertsRepository,
  })  : _alertsRepository = alertsRepository,
        super(AlertInitial()) {
    on<AlertSubscriptionRequested>(_onSubscriptionRequested);
    on<AlertToggleExpansion>(
      (event, emit) => emit(
        state.copyWith(isExpanded: !state.isExpanded),
      ),
    );
    on<AlertButtonPressed>((event, emit) async {
      emit(state.copyWith(
          lastPressedButtonIndex: event.buttonIndex, isResolving: true,),);

      await Future.delayed(const Duration(seconds: 3), () {
        emit(state.copyWith(isResolved: true));
      });
    });
  }

  final AlertsRepository _alertsRepository;

  Future<void> _onSubscriptionRequested(
    AlertSubscriptionRequested event,
    Emitter<AlertState> emit,
  ) async {
    emit(state.copyWith(status: () => AlertStatus.loading));

    await emit.forEach<List<Alert>>(
      _alertsRepository.getAlerts(),
      onData: (alerts) => state.copyWith(
        status: () => AlertStatus.success,
        alerts: () => alerts,
      ),
      onError: (_, __) => state.copyWith(
        status: () => AlertStatus.failure,
      ),
    );
  }
}
