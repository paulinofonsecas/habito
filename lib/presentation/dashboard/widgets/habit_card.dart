import 'package:flutter/material.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';

import 'custom_habit_status.dart';

class HabitCard extends StatefulWidget {
  const HabitCard({
    super.key,
    required this.habito,
    this.onConcluidoChanged,
    this.isCompleted,
    required this.onTap,
  });

  final bool? isCompleted;
  final Habito habito;
  final VoidCallback onTap;
  final ValueChanged<bool?>? onConcluidoChanged;

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 0, // Flat style
        color: Color(widget.habito.colorHex!).withValues(
          alpha: .04,
        ), // Flat background color
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  if (widget.habito.iconCode != null)
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(widget.habito.colorHex!)
                            .withValues(alpha: .08),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Icon(
                        IconData(widget.habito.iconCode!,
                            fontFamily: 'MaterialIcons'),
                        color: Color(widget.habito.colorHex!),
                        size: 32.0,
                      ),
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
                        if (widget.habito.descricao != null)
                          Text(
                            widget.habito.descricao!,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.bodySmall!,
                          ),
                      ],
                    ),
                  ),
                  CustomHabitStatus(
                    habito: widget.habito,
                    value: widget.isCompleted ?? widget.habito.isCompletedToday,
                    onChanged: widget.onConcluidoChanged,
                    activeColor: Color(widget.habito.colorHex!),
                    checkColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
