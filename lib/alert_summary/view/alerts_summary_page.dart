import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_link_interview/alert_summary/alert_overview.dart';
import 'package:home_link_interview/alert_summary/bloc/alerts_summary_bloc.dart';
import 'package:home_link_interview/repos/alerts_repository.dart';

class AlertsSummaryPage extends StatelessWidget {
  const AlertsSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlertsSummaryBloc(
        alertsRepository: context.read<AlertsRepository>(),
      )..add(const AlertsResolvedSummarySubscriptionRequested()),
      child: const AlertsSummaryView(),
    );
  }
}

class AlertsSummaryView extends StatelessWidget {
  const AlertsSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AlertsSummaryBloc, AlertsSummaryState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == AlertsSummaryStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Alert error'),
              ),
            );
        }
      },
      child: BlocBuilder<AlertsSummaryBloc, AlertsSummaryState>(
        builder: (context, state) {
          if (state.alerts.isEmpty) {
            if (state.status == AlertsSummaryStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status != AlertsSummaryStatus.success) {
              return const SizedBox();
            }
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Resolved Alerts',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: state.alerts.length,
                itemBuilder: (context, index) {
                  final alert = state.alerts[index];
                  return ListTile(
                    leading: const Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                    title: Text(alert.title),
                    subtitle: Text(
                      '${alert.address}\nResponded on: ${alert.completedAt}',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
