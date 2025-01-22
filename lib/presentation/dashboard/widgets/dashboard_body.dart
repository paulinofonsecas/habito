import 'package:flutter/material.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';
import 'package:habito_2/presentation/dashboard/provider/provider.dart';

import 'habit_card.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  DashboardBodyState createState() => DashboardBodyState();
}

class DashboardBodyState extends State<DashboardBody> {
  late DashboardNotifier dashboardNotifier;

  @override
  void initState() {
    super.initState();
    dashboardNotifier = Provider.of<DashboardNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildDashboardBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Adicionar Hábito',
        elevation: 0,
        child: const Icon(Icons.add), // Flat style
      ),
    );
  }

  Widget _buildDashboardBody() {
    return RefreshIndicator(
      onRefresh: () async => dashboardNotifier..listarHabitos(),
      child: ListenableBuilder(
        listenable: dashboardNotifier,
        builder: (context, child) {
          if (dashboardNotifier.habitos.isEmpty) {
            return const Center(
              child: Text('Nenhum hábito ainda. Comece a criar alguns!'),
            );
          }

          if (dashboardNotifier.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: dashboardNotifier.habitos.length,
            itemBuilder: (context, index) {
              final habito = dashboardNotifier.habitos[index];
              return HabitCard(
                habito: habito,
                onConcluidoChanged: (value) {
                  _toggleHabitoConcluido(habito, value);
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _toggleHabitoConcluido(Habito habito, bool? concluido) async {
    if (concluido == true) {
      dashboardNotifier.concluirHabito(habito);
    } else {
      dashboardNotifier.desconcluirHabito(habito);
    }
  }
}
