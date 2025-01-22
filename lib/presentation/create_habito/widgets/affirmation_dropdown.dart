import 'package:flutter/material.dart';

class AffirmationDropdown extends StatefulWidget {
  const AffirmationDropdown(
      {super.key, required this.affirmation, this.onChanged});

  final String? affirmation;
  final void Function(String?)? onChanged;

  @override
  _AffirmationDropdownState createState() => _AffirmationDropdownState();
}

class _AffirmationDropdownState extends State<AffirmationDropdown> {
  final List<String> _affirmationTypes = [
    "Eu quero", // I want to
    "Eu estou comprometido(a) com", // I am committed to
    "Eu escolho", // I choose to
    "Eu irei", // I will
    "Eu sou capaz de", // I am capable of
    "Eu mereço", // I deserve to
    "Eu acredito em", // I believe in
    "Eu me esforço para", // I strive to
    "Eu sou grato(a) por", // I am grateful for
    "Eu foco em", // I focus on
    "Eu abraço", // I embrace
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Afirmação',
      ),
      value: widget.affirmation, // Use the state variable
      items: _affirmationTypes.map((type) {
        return DropdownMenuItem(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}
