import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_link_interview/alert/alert.dart';
import 'package:home_link_interview/alert/bloc/alert_bloc.dart';
import 'package:home_link_interview/repos/alerts_repository.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlertBloc(
        alertsRepository: context.read<AlertsRepository>(),
      )..add(const AlertSubscriptionRequested()),
      child: const AlertView(),
    );
  }
}

class AlertView extends StatelessWidget {
  const AlertView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image(
            height: 30,
            width: 30,
            image: AssetImage('assets/plus_button.png'),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(
                  height: 35,
                  width: 35,
                  image: AssetImage(
                    'assets/logo.png',
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello Billy'),
                    Text('See your alerts below'),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                  height: 30,
                  width: 30,
                  image: AssetImage('assets/settings.png'),
                ),
                Image(
                  height: 30,
                  width: 30,
                  image: AssetImage('assets/person_icon.png'),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 30),
        AlertTile(),
      ],
    );
  }
}

class AlertTile extends StatelessWidget {
  const AlertTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertBloc, AlertState>(
      builder: (context, state) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;

        final buttons = [
          "Everything's OK",
          'Going to property now',
          'Call doctor',
          'I cannot visit',
        ];

        if (state.isResolved) {
          return const SizedBox.shrink();
        } else {
          return GestureDetector(
            onTap: () =>
                context.read<AlertBloc>().add(const AlertToggleExpansion()),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: state.isExpanded ? height / 2 : height / 6,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(
                  color: state.isResolving ? Colors.green : Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      for (final alert in state.alerts)
                        if (!alert.isResolved)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(alert.timeOfAlert),
                                  const Image(
                                    height: 60,
                                    width: 60,
                                    image: AssetImage(
                                      'assets/alert_with_resident.png',
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    alert.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  Text('at ${alert.address}'),
                                ],
                              ),
                            ],
                          ),
                      if (state.isExpanded && !state.isResolving)
                        ...List.generate(
                          4,
                          (i) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              width: width / 1.2,
                              child: OutlinedButton(
                                onPressed: () => context
                                    .read<AlertBloc>()
                                    .add(AlertButtonPressed(i)),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: const BorderSide(color: Colors.blue),
                                ),
                                child: Text(buttons[i]),
                              ),
                            ),
                          ),
                        ),
                      if (state.isExpanded && state.isResolving)
                        const Column(
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
              ),
            ),
          );
        }
      },
    );
  }
}
