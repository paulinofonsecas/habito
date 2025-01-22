import 'package:flutter/material.dart';

class CustomRadiuButton extends StatefulWidget {
  const CustomRadiuButton({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.checkColor,
  });

  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? checkColor;

  @override
  State<CustomRadiuButton> createState() => _CustomRadiuButtonState();
}

class _CustomRadiuButtonState extends State<CustomRadiuButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChanged?.call(!widget.value),
      borderRadius: BorderRadius.circular(90),
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: widget.value ? widget.activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
          border: !widget.value
              ? Border.all(
                  color: widget.activeColor ?? Colors.transparent,
                  width: 2,
                )
              : null,
        ),
        child: Center(
          child: widget.value
              ? Icon(
                  Icons.check,
                  size: 18,
                  color: widget.checkColor,
                )
              : null,
        ),
      ),
    );
  }
}
