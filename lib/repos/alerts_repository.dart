import 'package:equatable/equatable.dart';

class Alert extends Equatable {
  const Alert({
    required this.title,
    required this.address,
    required this.timeOfAlert,
    required this.isResolved,
  });

  final String title;
  final String address;
  final String timeOfAlert;
  final bool isResolved;

  @override
  List<Object?> get props => [title, address, timeOfAlert];
}

class AlertsRepository {
  Stream<List<Alert>> getAlerts() {
    return Stream.value([
      const Alert(
        title: 'SOS pendant activation',
        address: '39 The Springs, OX28 4AJ',
        timeOfAlert: 'Now',
        isResolved: false,
      ),
      const Alert(
        title: 'SOS pendant activation',
        address: '12 Crome Road, BS7 9YG',
        timeOfAlert: 'Now',
        isResolved: true,
      ),
      const Alert(
        title: 'SOS pendant activation',
        address: '12 Crome Road, BS7 9YG',
        timeOfAlert: 'Now',
        isResolved: true,
      ),
    ]);
  }
}
