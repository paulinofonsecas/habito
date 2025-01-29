import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';
import 'package:habito_2/presentation/dashboard/bottom_sheets/habito_detail_bottom_sheet.dart';
import 'package:habito_2/presentation/dashboard/provider/provider.dart';
import 'package:intl/intl.dart';

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
    return ListenableBuilder(
        listenable: dashboardNotifier,
        builder: (context, child) {
          return RefreshIndicator(
            onRefresh: () async => dashboardNotifier..listarHabitos(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyDateTimeLinePicker(
                  locale: Locale('pt', 'BR'),
                  headerOptions: HeaderOptions(
                    headerType: HeaderType.viewOnly,
                    headerBuilder: (context, date, onTap) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        DateFormat.MMMMEEEEd().format(date).toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  focusedDate: dashboardNotifier.focusedDate,
                  firstDate: DateTime(2024, 3, 18),
                  lastDate: DateTime(2030, 3, 18),
                  onDateChange: (date) {
                    dashboardNotifier.changeDate(date);
                  },
                ),
                Gutter(),
                Expanded(
                  child: ListenableBuilder(
                    listenable: dashboardNotifier,
                    builder: (context, child) {
                      if (dashboardNotifier.habitos.isEmpty) {
                        return const Center(
                          child: Text(
                              'Nenhum hábito ainda. Comece a criar alguns!'),
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
                            onTap: () => HabitoDetailBottomSheet.show(
                              context,
                              habito,
                            ),
                            habito: habito,
                            focusDate: dashboardNotifier.focusedDate,
                            isCompleted: habito.isCompletedToday2(
                                  dashboardNotifier.focusedDate,
                                ) >
                                0,
                            onConcluidoChanged: (value) {
                              // // caso a data seja diferente, significa que o usuário quer marcar/desmarcar o hábito para outra data
                              // if (dashboardNotifier.focusedDate !=
                              //     DateTime.now()) {
                              //   return;
                              // }

                              _toggleHabitoConcluido(habito, value);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<void> _toggleHabitoConcluido(Habito habito, bool? concluido) async {
    if (dashboardNotifier.focusedDate.isAfter(DateTime.now())) {
      return;
    }

    if (dashboardNotifier.focusedDate.year != DateTime.now().year ||
        dashboardNotifier.focusedDate.month != DateTime.now().month ||
        dashboardNotifier.focusedDate.day != DateTime.now().day) {
      return;
    }

    if (!habito.isCompletedToday) {
      dashboardNotifier.concluirHabito(habito, dashboardNotifier.focusedDate);
    } else {
      dashboardNotifier.desconcluirHabito(
          habito, dashboardNotifier.focusedDate);
    }
  }
}
