import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habito_2/app/dependencies/getit_service_locator.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';
import 'package:habito_2/domain/usecases/habito_usecases.dart';
import 'package:uuid/uuid.dart';

class CreateHabitoNotifier with ChangeNotifier {
  final createHabitoUseCase = sl<CriarHabitoUseCase>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  var selectedTime = DateTime.now();

  final List<String> daysOfWeek = [
    'Seg',
    'Ter',
    'Qua',
    'Qui',
    'Sex',
    'Sab',
    'Dom',
  ];
  final List<String> selectedDays = [];
  int dailyRecurrence2 = 1;
  int? selectedIconIndex;
  int? selectedColorIndex;
  String? selectedAffirmation;

  List<IconData> icons = [
    FontAwesomeIcons.heartbeat, // Saúde Física (bem-estar geral)
    FontAwesomeIcons.running, // Saúde Física (atividade física)
    FontAwesomeIcons.brain, // Saúde Mental (bem-estar mental)
    FontAwesomeIcons.bookOpen, // Saúde Mental (aprendizado e crescimento)
    FontAwesomeIcons.briefcase, // Produtividade (trabalho)
    FontAwesomeIcons.calendarAlt, // Produtividade (organização e planejamento)
    FontAwesomeIcons.heart, // Relacionamentos (conexões)
    FontAwesomeIcons.userFriends, // Relacionamentos (amizades)
    FontAwesomeIcons.piggyBank, // Finanças (economia)
    FontAwesomeIcons.moneyBillAlt, // Finanças (controle financeiro)
    FontAwesomeIcons
        .bell, // Notificações (lembretes e avisos) - ícone adicional
    FontAwesomeIcons
        .chartBar, // Progresso Geral (visualização do progresso) - ícone adicional
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

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      final newHabit = Habito(
        uuid: Uuid().v4(),
        nome: nameController.text,
        descricao: descricaoController.text,
        regularityDays: selectedDays,
        dailyRecurrence: dailyRecurrence2,
        reminders: [selectedTime],
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
      descricaoController.clear();
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

  bool get isAllDaysSelected {
    return selectedDays.length == daysOfWeek.length;
  }

  void toggleSelectAllDays() {
    if (isAllDaysSelected) {
      selectedDays.clear();
    } else {
      selectedDays.clear();
      selectedDays.addAll(daysOfWeek);
    }
    notifyListeners();
  }

  void toggleDay(String day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }
    notifyListeners();
  }

  void showMyTimePicker(BuildContext context) async {
    final result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedTime),
      confirmText: 'Salvar',
      cancelText: 'Cancelar',
      helpText: 'Selecione um horário',
    );

    if (result != null) {
      selectedTime = DateTime(
        selectedTime.year,
        selectedTime.month,
        selectedTime.day,
        result.hour,
        result.minute,
      );
      notifyListeners();
    }
  }

  void decrementDailyRecurrence() {
    if (dailyRecurrence2 > 1) {
      dailyRecurrence2--;
    }
    notifyListeners();
  }

  void incrementDailyRecurrence() {
    dailyRecurrence2++;
    notifyListeners();
  }

  void changeIcon(IconData icon) {
    if (!icons.contains(icon)) {
      icons.removeAt(0);
      icons.insert(0, icon);
      selectedIconIndex = icons.indexOf(icon);
    } else {
      selectedIconIndex = icons.indexOf(icon);
    }
    notifyListeners();
  }
}
