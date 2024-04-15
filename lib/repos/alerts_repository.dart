import 'package:home_link_interview/models/alert.dart';


class AlertsRepository {
  Stream<List<Alert>> getAlerts() {
    return Stream.value([
      const Alert(
        title: 'SOS pendant activation',
        address: '39 The Springs, OX28 4AJ',
        timeOfAlert: 'Now',
        completedAt: null,
        isResolved: false,
      ),
      const Alert(
        title: 'SOS pendant activation',
        address: '12 Crome Road, BS7 9YG',
        timeOfAlert: 'Now',
        completedAt: 'Yesterday',
        isResolved: true,
      ),
      const Alert(
        title: 'SOS pendant activation',
        address: '12 Crome Road, BS7 9YG',
        timeOfAlert: 'Now',
        completedAt: '9th April, 2024',
        isResolved: true,
      ),
    ]);
  }
}
