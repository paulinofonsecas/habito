import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habito_2/app/dependencies/getit_service_locator.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';
import 'package:habito_2/presentation/dashboard/dialogs/arquivar_habito_dialog.dart';
import 'package:habito_2/presentation/dashboard/provider/daily_habits_done_provider.dart';
import 'package:habito_2/presentation/dashboard/provider/provider.dart';

class HabitoDetailBottomSheet extends StatefulWidget {
  const HabitoDetailBottomSheet({super.key, required this.extHabito});

  final Habito extHabito;

  static void show(BuildContext context, Habito habito) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      constraints: const BoxConstraints(maxHeight: 500),
      builder: (BuildContext context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => DailyHabitsDoneNotifier(
                obterListaHabitosConcluidosUseCase: sl(),
              ),
            ),
          ],
          child: HabitoDetailBottomSheet(extHabito: habito),
        );
      },
    );
  }

  @override
  State<HabitoDetailBottomSheet> createState() =>
      _HabitoDetailBottomSheetState();
}

class _HabitoDetailBottomSheetState extends State<HabitoDetailBottomSheet> {
  late Habito habito;

  @override
  void initState() {
    habito = widget.extHabito;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              if (habito.iconCode != null)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(habito.colorHex!).withValues(alpha: .08),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    IconData(habito.iconCode!, fontFamily: 'MaterialIcons'),
                    color: Color(habito.colorHex!),
                    size: 32.0,
                  ),
                ),
              Gutter(),
              Text(
                habito.nome,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  habito.isActive != true ? Icons.unarchive : Icons.archive,
                  color: habito.isActive != true
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.error,
                ),
                onPressed: () async {
                  final result = await ArquivarDialog.show(
                    context,
                    value: habito.isActive!,
                  );

                  if (result == true && context.mounted) {
                    if (habito.isActive == true) {
                      Provider.of<DashboardNotifier>(context, listen: false)
                          .arquivarHabito(habito);
                      habito = habito.copyWith(isActive: false);
                    } else {
                      Provider.of<DashboardNotifier>(context, listen: false)
                          .desarquivarHabito(habito);
                      habito = habito.copyWith(isActive: true);
                    }

                    setState(() {});
                  }
                },
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.penToSquare,
                    color: Theme.of(context).colorScheme.primary),
                onPressed: () async {
                  final result = await ArquivarDialog.show(
                    context,
                    value: habito.isActive!,
                  );

                  if (result == true && context.mounted) {
                    if (habito.isActive == true) {
                      Provider.of<DashboardNotifier>(context, listen: false)
                          .arquivarHabito(habito);
                      habito = habito.copyWith(isActive: false);
                    } else {
                      Provider.of<DashboardNotifier>(context, listen: false)
                          .desarquivarHabito(habito);
                      habito = habito.copyWith(isActive: true);
                    }

                    setState(() {});
                  }
                },
              )
            ],
          ),
          if (habito.descricao != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gutter(),
                Text(
                  'Descrição: ',
                ),
                Text(
                  habito.descricao!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          Gutter(),
          Text(
            'Frequência: ',
          ),
          GutterTiny(),
          if (habito.regularityDays.length == 7)
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Todos os dias',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            )
          else
            Row(
              children: habito.regularityDays
                  .map((e) => Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          e,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          Gutter(),
          Text(
            'Recorrencia: ',
          ),
          Text(
            '${habito.dailyRecurrence} vezes por dia',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          Gutter(),
          Text(
            'Lembrete: ',
          ),
          Text(
            '${habito.reminders.length} lembretes',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          GutterLarge(),
          Text('Histórico (${habito.completedDates.length})',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          GutterSmall(),
          Wrap(
            spacing: 8,
            children: habito.completedDates
                .map(
                  (reminder) => Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color(habito.colorHex!),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  String remindersToString(List<String> reminders) {
    if (reminders.isEmpty) {
      return 'Nenhuma';
    }

    if (reminders.length == 7) {
      return 'Todos os dias';
    }

    return reminders.join(', ');
  }
}
