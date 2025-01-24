import 'package:flutter/material.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';

class CustomHabitStatus extends StatefulWidget {
  const CustomHabitStatus({
    super.key,
    required this.habito,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.checkColor,
  });

  final Habito habito;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? checkColor;

  @override
  State<CustomHabitStatus> createState() => _CustomHabitStatusState();
}

class _CustomHabitStatusState extends State<CustomHabitStatus> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChanged?.call(!widget.value),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: widget.value
              ? widget.activeColor
              : widget.activeColor?.withValues(alpha: .08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Icon(
          Icons.check,
          size: 18,
          color: !widget.value ? widget.activeColor : widget.checkColor,
        )),
      ),
    );
  }
}
