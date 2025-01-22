import 'package:flutter/material.dart';
import 'package:habito_2/presentation/create_habito/view/create_habito_page.dart';
import 'package:habito_2/presentation/dashboard/bottom_sheet/daily_habits_done_bottom_sheet.dart';
import 'package:habito_2/presentation/dashboard/provider/provider.dart';
import 'package:habito_2/presentation/dashboard/widgets/dashboard_body.dart';

/// {@template dashboard_page}
/// A description for DashboardPage
/// {@endtemplate}
class DashboardPage extends StatelessWidget {
  /// {@macro dashboard_page}
  const DashboardPage({super.key});

  /// The static route for DashboardPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const DashboardPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DashboardNotifier(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Hábitos'),
            actions: [
              IconButton(
                onPressed: () {
                  DailyHabitsDoneBottomSheet.show(context);
                },
                icon: Icon(Icons.done_all),
              ),
              SizedBox(width: 16),
            ],
          ),
          body: DashboardView(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(CreateHabitoPage.route());
            },
            tooltip: 'Adicionar Hábito',
            elevation: 0,
            child: const Icon(Icons.add), // Flat style
          ),
        );
      }),
    );
  }
}

/// {@template dashboard_view}
/// Displays the Body of DashboardView
/// {@endtemplate}
class DashboardView extends StatelessWidget {
  /// {@macro dashboard_view}
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardBody();
  }
}
