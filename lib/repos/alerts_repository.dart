import 'package:home_link_interview/models/alert.dart';
import 'package:rxdart/subjects.dart';

final alertsList = [
  const Alert(
    id: 1,
    title: 'SOS pendant activation',
    address: '39 The Springs, OX28 4AJ',
    timeOfAlert: 'Now',
    completedAt: null,
    isResolved: false,
  ),
  const Alert(
    id: 2,
    title: 'SOS pendant activation',
    address: '12 Crome Road, BS7 9YG',
    timeOfAlert: 'Now',
    completedAt: 'Yesterday',
    isResolved: true,
  ),
  const Alert(
    id: 3,
    title: 'SOS pendant activation',
    address: '12 Crome Road, BS7 9YG',
    timeOfAlert: 'Now',
    completedAt: '9th April, 2024',
    isResolved: true,
  ),
];

class AlertsRepository {
  AlertsRepository() : _alertsList = BehaviorSubject.seeded(alertsList ?? []);

  final BehaviorSubject<List<Alert>> _alertsList;

  Stream<List<Alert>> getAlerts() => _alertsList.stream;

  void resolveAlert(int id, DateTime completedAt) {
    final currentAlerts = _alertsList.value;
    final index = currentAlerts.indexWhere((Alert alert) => alert.id == id);
    if (index != -1) {
      currentAlerts[index] = currentAlerts[index]
          .copyWith(isResolved: true, completedAt: completedAt.toString());
      _alertsList.add(
        List<Alert>.from(currentAlerts),
      );
    }
  }

  // Dispose method to close the stream
  void dispose() {
    _alertsList.close();
  }
}
