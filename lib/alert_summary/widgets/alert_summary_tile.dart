import 'package:flutter/material.dart';
import 'package:home_link_interview/models/alert.dart';

class AlertSummaryTile extends StatelessWidget {
  const AlertSummaryTile({required this.alert, super.key});

  final Alert alert;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        
      ),
    );
  }
}
