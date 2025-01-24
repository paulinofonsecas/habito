import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:habito_2/app/helpers/formaters.dart';
import 'package:habito_2/presentation/create_habito/provider/create_habito_provider.dart';
import 'package:habito_2/presentation/dashboard/provider/provider.dart';

class FrequenceBottomSheet extends StatefulWidget {
  const FrequenceBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (c) => ChangeNotifierProvider.value(
        value: Provider.of<CreateHabitoNotifier>(context, listen: false),
        child: const FrequenceBottomSheet(),
      ),
    );
  }

  @override
  State<FrequenceBottomSheet> createState() => _FrequenceBottomSheetState();
}

class _FrequenceBottomSheetState extends State<FrequenceBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final createHabitoNotifier = Provider.of<CreateHabitoNotifier>(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Frequência',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: createHabitoNotifier.daysOfWeek
                .map(
                  (day) => InkWell(
                    onTap: () {
                      createHabitoNotifier.toggleDay(day);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: createHabitoNotifier.selectedDays.contains(day)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        day,
                        style: TextStyle(
                          color: createHabitoNotifier.selectedDays.contains(day)
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                createHabitoNotifier.toggleSelectAllDays();
              },
              child: Text(createHabitoNotifier.isAllDaysSelected
                  ? 'Deselecionar tudo'
                  : 'Selecionar tudo'),
            ),
          ),
          GutterLarge(),
          if (createHabitoNotifier.selectedDays.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hora'),
                GutterSmall(),
                InkWell(
                  onTap: () {
                    createHabitoNotifier.showMyTimePicker(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 42,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text('Selecione um horário'),
                        Spacer(),
                        Text(
                            timeFormat
                                .format(createHabitoNotifier.selectedTime),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                )),
                      ],
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
