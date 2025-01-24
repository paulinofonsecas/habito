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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 0, // Flat style
      color: Colors.grey.shade100, // Flat background color
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            if (widget.habito.iconCode != null)
              Icon(
                IconData(widget.habito.iconCode!, fontFamily: 'MaterialIcons'),
                color: Theme.of(context).primaryColor,
                size: 32.0,
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
            CustomRadiuButton(
              value: widget.habito.isCompletedToday,
              onChanged: widget.onConcluidoChanged,
              activeColor:
                  Theme.of(context).primaryColor, // Customize active color
              checkColor: Colors.white, // Customize check color
            ),
          ],
        ),
      ),
    );
  }
}
