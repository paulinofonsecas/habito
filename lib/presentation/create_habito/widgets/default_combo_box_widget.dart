import 'package:flutter/material.dart';

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
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .7),
        ),
      ),
      child: child,
    );
  }
}
