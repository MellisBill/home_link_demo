part of 'alerts_summary_bloc.dart';

sealed class AlertsSummaryEvent extends Equatable {
  const AlertsSummaryEvent();

  @override
  List<Object> get props => [];
}

final class AlertsSummarySubscriptionRequested extends AlertsSummaryEvent {
  const AlertsSummarySubscriptionRequested();
}

// final class AlertsSummaryTodoCompletionToggled extends AlertsSummaryEvent {
//   const AlertsSummaryTodoCompletionToggled({
//     required this.alert,
//     required this.isCompleted,
//   });

//   final String alert;
//   final bool isCompleted;

//   @override
//   List<Object> get props => [alert, isCompleted];
// }
