import 'package:flutter/material.dart';
import 'package:habito_2/app/dependencies/getit_service_locator.dart';
import 'package:habito_2/presentation/dashboard/provider/daily_habits_done_provider.dart';
import 'package:habito_2/presentation/dashboard/provider/provider.dart';
import 'package:habito_2/presentation/dashboard/widgets/habit_card.dart';

class DailyHabitsDoneBottomSheet extends StatefulWidget {
  const DailyHabitsDoneBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => DailyHabitsDoneNotifier(
                obterListaHabitosConcluidosUseCase: sl(),
              ),
            ),
          ],
          child: DailyHabitsDoneBottomSheet(),
        );
      },
    );
  }

  @override
  State<DailyHabitsDoneBottomSheet> createState() =>
      _DailyHabitsDoneBottomSheetState();
}

class _DailyHabitsDoneBottomSheetState
    extends State<DailyHabitsDoneBottomSheet> {
  late DailyHabitsDoneNotifier dailyHabitsDone;

  @override
  void dispose() {
    dailyHabitsDone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dailyHabitsDone =
        Provider.of<DailyHabitsDoneNotifier>(context, listen: false);

    if (dailyHabitsDone.habitosConcluidos.isEmpty &&
        !dailyHabitsDone.isLoading) {
      dailyHabitsDone.loadHabitosConcluidos();
    }

    return ListenableBuilder(
      listenable: dailyHabitsDone,
      builder: (context, child) {
        return ListView.builder(
          itemCount: dailyHabitsDone.habitosConcluidos.length,
          itemBuilder: (context, index) {
            final habito = dailyHabitsDone.habitosConcluidos[index];
            return HabitCard(
              habito: habito,
            );
          },
        );
      },
    );
  }
}
