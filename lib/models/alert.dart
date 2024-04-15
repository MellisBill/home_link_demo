import 'package:equatable/equatable.dart';

class Alert extends Equatable {
  const Alert({
    required this.id,
    required this.title,
    required this.address,
    required this.timeOfAlert,
    required this.completedAt,
    required this.isResolved,
  });

  final int id;
  final String title;
  final String address;
  final String timeOfAlert;
  final String? completedAt;
  final bool isResolved;

  Alert copyWith({
    int? id,
    String? title,
    String? address,
    String? timeOfAlert,
    String? completedAt,
    bool? isResolved,
  }) {
    return Alert(
      id: id ?? this.id,
      title: title ?? this.title,
      address: address ?? this.address,
      timeOfAlert: timeOfAlert ?? this.timeOfAlert,
      completedAt: completedAt ?? this.completedAt,
      isResolved: isResolved ?? this.isResolved,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        address,
        timeOfAlert,
        completedAt,
        isResolved,
      ];
}
