import 'package:flutter/material.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';

import 'custom_radiu_button.dart';

class HabitCard extends StatefulWidget {
  final Habito habito;
  final ValueChanged<bool?>? onConcluidoChanged;

  const HabitCard({
    super.key,
    required this.habito,
    this.onConcluidoChanged,
  });

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  @override
  Widget build(BuildContext context) {
    final bool isConcluidoHoje = widget.habito.completedDates.any((date) =>
        date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 0, // Flat style
      color: Colors.grey.shade100, // Flat background color
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CustomRadiuButton(
              value: isConcluidoHoje,
              onChanged: widget.onConcluidoChanged,
              activeColor:
                  Theme.of(context).primaryColor, // Customize active color
              checkColor: Colors.white, // Customize check color
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.habito.nome,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // TODO: Show more options (edit, delete, details)
                print('More options for habit ${widget.habito.nome}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
