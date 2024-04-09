import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_link_interview/alert/alert.dart';
import 'package:home_link_interview/alert/bloc/alert_bloc.dart';
import 'package:home_link_interview/alert/widgets/alert_tile.dart';
import 'package:home_link_interview/repos/alerts_repository.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlertBloc(
        alertsRepository: context.read<AlertsRepository>(),
      )..add(AlertSubscriptionRequested()),
      child: AlertView(),
    );
  }
}

class AlertView extends StatelessWidget {
  const AlertView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertBloc, AlertState>(
      builder: (context, state) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;

        if (state.isResolved) {
          return SizedBox.shrink();
        } else {
          return GestureDetector(
            onTap: () =>
                context.read<AlertBloc>().add(const AlertToggleExpansion()),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: state.isExpanded ? height / 2 : height / 6,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(
                    color: state.isResolved ? Colors.green : Colors.red,
                    width: 2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: <Widget>[
                  for (final alert in state.alerts)
                    if (!alert.isResolved) AlertTile(alert: alert),
                  if (state.isExpanded && !state.isResolving)
                    ...List.generate(
                      4,
                      (i) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () => context
                              .read<AlertBloc>()
                              .add(AlertButtonPressed(i)),
                          child: Text('Button ${i + 1}'),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  if (state.isExpanded && state.isResolving)
                    Column(
                      children: [
                        Text('Thanks for submitting'),
                        Image(
                          height: 100,
                          width: 100,
                          image: AssetImage('assets/home_link_tick.gif'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
