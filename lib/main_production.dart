import 'package:home_link_interview/app/app.dart';
import 'package:home_link_interview/bootstrap.dart';
import 'package:home_link_interview/repos/alerts_repository.dart';

void main() {
  final alertsRepository = AlertsRepository();

  bootstrap(() => App(alertsRepository: alertsRepository));
}
