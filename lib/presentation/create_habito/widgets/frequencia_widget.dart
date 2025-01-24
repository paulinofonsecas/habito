import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:habito_2/app/helpers/formaters.dart';
import 'package:habito_2/presentation/create_habito/bottom_sheets/frequence_bottom_sheet.dart';
import 'package:habito_2/presentation/create_habito/provider/create_habito_provider.dart';
import 'package:habito_2/presentation/dashboard/provider/provider.dart';

class FrequenciaWidget extends StatelessWidget {
  const FrequenciaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final createHabitoNotifier = Provider.of<CreateHabitoNotifier>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Frequência', style: Theme.of(context).textTheme.bodyMedium!),
        GutterSmall(),
        InkWell(
          onTap: () {
            FrequenceBottomSheet.show(context);
          },
          child: DefaultComboBoxWidget(
            child: Row(
              children: [
                createHabitoNotifier.selectedDays.isEmpty &&
                        !createHabitoNotifier.isAllDaysSelected
                    ? Expanded(child: Text('Nenhum'))
                    : Expanded(
                        child: createHabitoNotifier.isAllDaysSelected
                            ? Text(
                                'Todos os dias ${timeFormat.format(createHabitoNotifier.selectedTime)}')
                            : AutoSizeText(
                                '${createHabitoNotifier.selectedDays.map((day) => day.toLowerCase()).join(',')} ${timeFormat.format(createHabitoNotifier.selectedTime)}',
                                maxLines: 1,
                                minFontSize: 10,
                              ),
                      ),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DefaultComboBoxWidget extends StatelessWidget {
  const DefaultComboBoxWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 42,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: child,
    );
  }
}
