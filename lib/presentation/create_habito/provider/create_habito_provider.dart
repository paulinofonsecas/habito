import 'package:flutter/material.dart';
import 'package:habito_2/app/dependencies/getit_service_locator.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';
import 'package:habito_2/domain/usecases/habito_usecases.dart';
import 'package:uuid/uuid.dart';

class CreateHabitoNotifier with ChangeNotifier {
  final createHabitoUseCase = sl<CriarHabitoUseCase>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController goalController = TextEditingController();

  final List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  final List<String> selectedDays = [];
  int dailyRecurrence2 = 1;
  int? selectedIconIndex;
  int? selectedColorIndex;
  String? selectedAffirmation;

  final List<IconData> icons = [
    Icons.favorite,
    Icons.facebook,
    Icons.camera_alt,
    Icons.coffee,
    Icons.fastfood,
    Icons.movie,
    Icons.bed,
    Icons.celebration,
    Icons.business,
    Icons.fitness_center,
    Icons.tv,
    Icons.music_note
  ];

  final List<Color> colors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  void salvarHabito() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      formKey.currentState!.reset();

      notifyListeners();
    }
  }

  void submitForm() async {
    if (formKey.currentState!.validate()) {
      final newHabit = Habito(
        uuid: Uuid().v4(),
        nome: nameController.text,
        affirmation: Affirmation(
            type: selectedAffirmation ?? '', text: goalController.text),
        regularityDays: selectedDays,
        dailyRecurrence: dailyRecurrence2,
        iconCode: selectedIconIndex != null
            ? icons[selectedIconIndex!].codePoint
            : null,
        colorHex: selectedColorIndex != null
            ? colors[selectedColorIndex!].value
            : null,
        completedDates: [],
        lastCompletedAt: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await createHabitoUseCase.executar(novoHabito: newHabit);

      nameController.clear();
      goalController.clear();
      selectedDays.clear();
      dailyRecurrence2 = 1;
      selectedIconIndex = null;
      selectedColorIndex = null;
      selectedAffirmation = null;

      notifyListeners();
    } else {
      throw Exception(
          'Formulário inválido. Por favor, preencha todos os campos.');
    }
  }
}
