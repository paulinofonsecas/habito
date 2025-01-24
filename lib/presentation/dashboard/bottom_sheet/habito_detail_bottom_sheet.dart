import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:habito_2/app/dependencies/getit_service_locator.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';
import 'package:habito_2/presentation/dashboard/provider/daily_habits_done_provider.dart';
import 'package:habito_2/presentation/dashboard/provider/provider.dart';

class HabitoDetailBottomSheet extends StatefulWidget {
  const HabitoDetailBottomSheet({super.key, required this.habito});

  final Habito habito;

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
          child: HabitoDetailBottomSheet(habito: habito),
        );
      },
    );
  }

  @override
  State<HabitoDetailBottomSheet> createState() =>
      _HabitoDetailBottomSheetState();
}

class _HabitoDetailBottomSheetState extends State<HabitoDetailBottomSheet> {
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
              if (widget.habito.iconCode != null)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color:
                        Color(widget.habito.colorHex!).withValues(alpha: .08),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    IconData(widget.habito.iconCode!,
                        fontFamily: 'MaterialIcons'),
                    color: Color(widget.habito.colorHex!),
                    size: 32.0,
                  ),
                ),
              Gutter(),
              Text(
                widget.habito.nome,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          if (widget.habito.descricao != null)
            Column(
              children: [
                Gutter(),
                Text(
                  'Descrição: ',
                ),
                Text(
                  widget.habito.descricao!,
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
          Text(
            remindersToString(widget.habito.regularityDays),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          GutterSmall(),
          Text(
            'Recorrencia: ',
          ),
          Text(
            '${widget.habito.dailyRecurrence} vezes por dia',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          GutterSmall(),
          Text(
            'Lembrete: ',
          ),
          Text(
            '${widget.habito.reminders.length} lembretes',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          GutterLarge(),
          Text('Histórico (${widget.habito.completedDates.length})',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          GutterSmall(),
          Wrap(
            spacing: 8,
            children: widget.habito.completedDates
                .map(
                  (reminder) => Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color(widget.habito.colorHex!),
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
    return reminders.join(', ');
  }
}
