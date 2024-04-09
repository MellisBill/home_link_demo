import 'package:flutter/material.dart';
import 'package:home_link_interview/repos/alerts_repository.dart';

class AlertTile extends StatelessWidget {
  const AlertTile({required this.alert, super.key});

  final Alert alert;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(alert.timeOfAlert),
            const Image(
              height: 60,
              width: 60,
              image: AssetImage('assets/alert_with_resident.png'),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              alert.title,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(alert.address),
          ],
        )
      ],
    );
  }
}
