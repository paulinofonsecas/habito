import 'package:freezed_annotation/freezed_annotation.dart';

part 'habito.freezed.dart';
part 'habito.g.dart';

int _colorHexFromJson(String? colorHex) =>
    int.tryParse(colorHex?.substring(1) ?? '', radix: 16) ?? 0;

String _colorHexToJson(int? colorHex) => '#${colorHex?.toRadixString(16)}';

@freezed
class Habito with _$Habito {
  factory Habito({
    required String uuid,
    int? id,
    required String nome,
    String? descricao,
    @JsonKey(name: 'regularity_days') @Default([]) List<String> regularityDays,
    @JsonKey(name: 'daily_recurrence') @Default(1) int dailyRecurrence,
    @Default([]) List<DateTime> reminders,
    int? iconCode,
    @JsonKey(
        name: 'color_hex', fromJson: _colorHexFromJson, toJson: _colorHexToJson)
    int? colorHex,
    @JsonKey(name: 'completed_dates')
    @Default(<DateTime>[])
    List<DateTime> completedDates,
    @JsonKey(name: 'last_completed_at') DateTime? lastCompletedAt,
    @Default(true) bool? isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Habito;

  factory Habito.fromJson(Map<String, dynamic> json) => _$HabitoFromJson(json);
}

extension HabitoX on Habito {
  bool get isCompletedToday {
    if (dailyRecurrence == 1) {
      return completedDates.any((date) =>
          date.year == DateTime.now().year &&
          date.month == DateTime.now().month &&
          date.day == DateTime.now().day);
    } else {
      return frequency == dailyRecurrence;
    }
  }

  int isCompletedToday2(DateTime comparedDate) => completedDates
      .where((date) =>
          date.year == comparedDate.year &&
          date.month == comparedDate.month &&
          date.day == comparedDate.day)
      .length;

  // retorna a quantidade de frequencia de conclusão no dia
  int get frequency {
    if (completedDates.isEmpty) return 0;
    final today = DateTime.now();
    int frequency = 0;
    for (final completedDate in completedDates) {
      if (completedDate.year == today.year &&
          completedDate.month == today.month &&
          completedDate.day == today.day) {
        frequency++;
      }
    }
    return frequency;
  }

  int frequency2(DateTime comparedDate) => completedDates
      .where((date) =>
          date.year == comparedDate.year &&
          date.month == comparedDate.month &&
          date.day == comparedDate.day)
      .length;

  int get currentStreak {
    if (completedDates.isEmpty) return 0;
    final today = DateTime.now();
    int streak = 0;
    DateTime currentDate = today;

    final sortedCompletedDates = completedDates.toList();
    sortedCompletedDates.sort((a, b) => b.compareTo(a));

    for (final completedDate in sortedCompletedDates) {
      if (completedDate.year == currentDate.year &&
          completedDate.month == currentDate.month &&
          completedDate.day == currentDate.day) {
        streak++;
        currentDate = currentDate.subtract(const Duration(days: 1));
      } else {
        if (completedDate.isBefore(currentDate)) {
          break;
        }
      }
    }
    return streak;
  }
}
