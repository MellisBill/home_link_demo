import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_link_interview/alert_summary/alert_overview.dart';
import 'package:home_link_interview/alert_summary/bloc/alerts_summary_bloc.dart';
import 'package:home_link_interview/alert_summary/widgets/alert_tile.dart';
import 'package:home_link_interview/repos/alerts_repository.dart';

class AlertsSummaryPage extends StatelessWidget {
  const AlertsSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlertsSummaryBloc(
        alertsRepository: context.read<AlertsRepository>(),
      )..add(const AlertsSummarySubscriptionRequested()),
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
            } else {
              return Center(
                child: Text(
                  'hello',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }
          }
          return ListView(
            children: [
              for (final alert in state.alerts)
                if (!alert.isResolved) AlertTile(alert: alert),
            ],
          );
        },
      ),
    );
  }
}
