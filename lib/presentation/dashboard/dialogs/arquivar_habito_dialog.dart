import 'package:flutter/material.dart';

class ArquivarDialog extends StatelessWidget {
  const ArquivarDialog({super.key, this.value});

  final bool? value;

  static Future<bool?> show(BuildContext context, {required bool value}) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ArquivarDialog(
        value: value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = value == true ? 'Arquivar' : 'Desarquivar';

    return AlertDialog(
      title: Text('$title Hábito?'),
      content: Text('Deseja ${title.toLowerCase()} o habito?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: () => Navigator.pop(context, true),
          child: Text(title),
        ),
      ],
    );
  }
}
