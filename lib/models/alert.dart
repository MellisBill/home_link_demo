import 'package:equatable/equatable.dart';

class Alert extends Equatable {
  const Alert({
    required this.title,
    required this.address,
    required this.timeOfAlert,
    required this.completedAt,
    required this.isResolved,
  });

  final String title;
  final String address;
  final String timeOfAlert;
  final String? completedAt;
  final bool isResolved;

  @override
  List<Object?> get props => [title, address, timeOfAlert];
}
