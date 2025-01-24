import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:habito_2/presentation/create_habito/provider/create_habito_provider.dart';
import 'package:habito_2/presentation/dashboard/provider/provider.dart';

class ConclusoesDiariasWidget extends StatelessWidget {
  const ConclusoesDiariasWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final createHabitoNotifier = Provider.of<CreateHabitoNotifier>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Conclusões por dia',
                style: Theme.of(context).textTheme.bodyMedium!),
            GutterSmall(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${createHabitoNotifier.dailyRecurrence2} / dia'),
                Gutter(),
                InkWell(
                  onTap: () {
                    createHabitoNotifier.decrementDailyRecurrence();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(Icons.remove, size: 16),
                    ),
                  ),
                ),
                GutterTiny(),
                InkWell(
                  onTap: () {
                    createHabitoNotifier.incrementDailyRecurrence();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(Icons.add, size: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
