// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habito.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Habito _$HabitoFromJson(Map<String, dynamic> json) {
  return _Habito.fromJson(json);
}

/// @nodoc
mixin _$Habito {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  @JsonKey(toJson: _$AffirmationToJson)
  Affirmation get affirmation => throw _privateConstructorUsedError;
  @JsonKey(name: 'regularity_days')
  List<String> get regularityDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'daily_recurrence')
  int get dailyRecurrence => throw _privateConstructorUsedError;
  List<String> get reminders => throw _privateConstructorUsedError;
  int? get iconCode => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'color_hex', fromJson: _colorHexFromJson, toJson: _colorHexToJson)
  int? get colorHex => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_dates')
  List<DateTime> get completedDates => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_completed_at')
  DateTime? get lastCompletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Habito to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Habito
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitoCopyWith<Habito> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitoCopyWith<$Res> {
  factory $HabitoCopyWith(Habito value, $Res Function(Habito) then) =
      _$HabitoCopyWithImpl<$Res, Habito>;
  @useResult
  $Res call(
      {String id,
      String nome,
      @JsonKey(toJson: _$AffirmationToJson) Affirmation affirmation,
      @JsonKey(name: 'regularity_days') List<String> regularityDays,
      @JsonKey(name: 'daily_recurrence') int dailyRecurrence,
      List<String> reminders,
      int? iconCode,
      @JsonKey(
          name: 'color_hex',
          fromJson: _colorHexFromJson,
          toJson: _colorHexToJson)
      int? colorHex,
      @JsonKey(name: 'completed_dates') List<DateTime> completedDates,
      @JsonKey(name: 'last_completed_at') DateTime? lastCompletedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $AffirmationCopyWith<$Res> get affirmation;
}

/// @nodoc
class _$HabitoCopyWithImpl<$Res, $Val extends Habito>
    implements $HabitoCopyWith<$Res> {
  _$HabitoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Habito
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? affirmation = null,
    Object? regularityDays = null,
    Object? dailyRecurrence = null,
    Object? reminders = null,
    Object? iconCode = freezed,
    Object? colorHex = freezed,
    Object? completedDates = null,
    Object? lastCompletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      affirmation: null == affirmation
          ? _value.affirmation
          : affirmation // ignore: cast_nullable_to_non_nullable
              as Affirmation,
      regularityDays: null == regularityDays
          ? _value.regularityDays
          : regularityDays // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dailyRecurrence: null == dailyRecurrence
          ? _value.dailyRecurrence
          : dailyRecurrence // ignore: cast_nullable_to_non_nullable
              as int,
      reminders: null == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      iconCode: freezed == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as int?,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int?,
      completedDates: null == completedDates
          ? _value.completedDates
          : completedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      lastCompletedAt: freezed == lastCompletedAt
          ? _value.lastCompletedAt
          : lastCompletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Habito
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AffirmationCopyWith<$Res> get affirmation {
    return $AffirmationCopyWith<$Res>(_value.affirmation, (value) {
      return _then(_value.copyWith(affirmation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HabitoImplCopyWith<$Res> implements $HabitoCopyWith<$Res> {
  factory _$$HabitoImplCopyWith(
          _$HabitoImpl value, $Res Function(_$HabitoImpl) then) =
      __$$HabitoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nome,
      @JsonKey(toJson: _$AffirmationToJson) Affirmation affirmation,
      @JsonKey(name: 'regularity_days') List<String> regularityDays,
      @JsonKey(name: 'daily_recurrence') int dailyRecurrence,
      List<String> reminders,
      int? iconCode,
      @JsonKey(
          name: 'color_hex',
          fromJson: _colorHexFromJson,
          toJson: _colorHexToJson)
      int? colorHex,
      @JsonKey(name: 'completed_dates') List<DateTime> completedDates,
      @JsonKey(name: 'last_completed_at') DateTime? lastCompletedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $AffirmationCopyWith<$Res> get affirmation;
}

/// @nodoc
class __$$HabitoImplCopyWithImpl<$Res>
    extends _$HabitoCopyWithImpl<$Res, _$HabitoImpl>
    implements _$$HabitoImplCopyWith<$Res> {
  __$$HabitoImplCopyWithImpl(
      _$HabitoImpl _value, $Res Function(_$HabitoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Habito
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? affirmation = null,
    Object? regularityDays = null,
    Object? dailyRecurrence = null,
    Object? reminders = null,
    Object? iconCode = freezed,
    Object? colorHex = freezed,
    Object? completedDates = null,
    Object? lastCompletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$HabitoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      affirmation: null == affirmation
          ? _value.affirmation
          : affirmation // ignore: cast_nullable_to_non_nullable
              as Affirmation,
      regularityDays: null == regularityDays
          ? _value._regularityDays
          : regularityDays // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dailyRecurrence: null == dailyRecurrence
          ? _value.dailyRecurrence
          : dailyRecurrence // ignore: cast_nullable_to_non_nullable
              as int,
      reminders: null == reminders
          ? _value._reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      iconCode: freezed == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as int?,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int?,
      completedDates: null == completedDates
          ? _value._completedDates
          : completedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      lastCompletedAt: freezed == lastCompletedAt
          ? _value.lastCompletedAt
          : lastCompletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitoImpl implements _Habito {
  _$HabitoImpl(
      {required this.id,
      required this.nome,
      @JsonKey(toJson: _$AffirmationToJson) required this.affirmation,
      @JsonKey(name: 'regularity_days')
      final List<String> regularityDays = const [],
      @JsonKey(name: 'daily_recurrence') this.dailyRecurrence = 1,
      final List<String> reminders = const [],
      this.iconCode,
      @JsonKey(
          name: 'color_hex',
          fromJson: _colorHexFromJson,
          toJson: _colorHexToJson)
      this.colorHex,
      @JsonKey(name: 'completed_dates')
      final List<DateTime> completedDates = const [],
      @JsonKey(name: 'last_completed_at') this.lastCompletedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _regularityDays = regularityDays,
        _reminders = reminders,
        _completedDates = completedDates;

  factory _$HabitoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitoImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  @JsonKey(toJson: _$AffirmationToJson)
  final Affirmation affirmation;
  final List<String> _regularityDays;
  @override
  @JsonKey(name: 'regularity_days')
  List<String> get regularityDays {
    if (_regularityDays is EqualUnmodifiableListView) return _regularityDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regularityDays);
  }

  @override
  @JsonKey(name: 'daily_recurrence')
  final int dailyRecurrence;
  final List<String> _reminders;
  @override
  @JsonKey()
  List<String> get reminders {
    if (_reminders is EqualUnmodifiableListView) return _reminders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminders);
  }

  @override
  final int? iconCode;
  @override
  @JsonKey(
      name: 'color_hex', fromJson: _colorHexFromJson, toJson: _colorHexToJson)
  final int? colorHex;
  final List<DateTime> _completedDates;
  @override
  @JsonKey(name: 'completed_dates')
  List<DateTime> get completedDates {
    if (_completedDates is EqualUnmodifiableListView) return _completedDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedDates);
  }

  @override
  @JsonKey(name: 'last_completed_at')
  final DateTime? lastCompletedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Habito(id: $id, nome: $nome, affirmation: $affirmation, regularityDays: $regularityDays, dailyRecurrence: $dailyRecurrence, reminders: $reminders, iconCode: $iconCode, colorHex: $colorHex, completedDates: $completedDates, lastCompletedAt: $lastCompletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.affirmation, affirmation) ||
                other.affirmation == affirmation) &&
            const DeepCollectionEquality()
                .equals(other._regularityDays, _regularityDays) &&
            (identical(other.dailyRecurrence, dailyRecurrence) ||
                other.dailyRecurrence == dailyRecurrence) &&
            const DeepCollectionEquality()
                .equals(other._reminders, _reminders) &&
            (identical(other.iconCode, iconCode) ||
                other.iconCode == iconCode) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            const DeepCollectionEquality()
                .equals(other._completedDates, _completedDates) &&
            (identical(other.lastCompletedAt, lastCompletedAt) ||
                other.lastCompletedAt == lastCompletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nome,
      affirmation,
      const DeepCollectionEquality().hash(_regularityDays),
      dailyRecurrence,
      const DeepCollectionEquality().hash(_reminders),
      iconCode,
      colorHex,
      const DeepCollectionEquality().hash(_completedDates),
      lastCompletedAt,
      createdAt,
      updatedAt);

  /// Create a copy of Habito
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitoImplCopyWith<_$HabitoImpl> get copyWith =>
      __$$HabitoImplCopyWithImpl<_$HabitoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitoImplToJson(
      this,
    );
  }
}

abstract class _Habito implements Habito {
  factory _Habito(
      {required final String id,
      required final String nome,
      @JsonKey(toJson: _$AffirmationToJson)
      required final Affirmation affirmation,
      @JsonKey(name: 'regularity_days') final List<String> regularityDays,
      @JsonKey(name: 'daily_recurrence') final int dailyRecurrence,
      final List<String> reminders,
      final int? iconCode,
      @JsonKey(
          name: 'color_hex',
          fromJson: _colorHexFromJson,
          toJson: _colorHexToJson)
      final int? colorHex,
      @JsonKey(name: 'completed_dates') final List<DateTime> completedDates,
      @JsonKey(name: 'last_completed_at') final DateTime? lastCompletedAt,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$HabitoImpl;

  factory _Habito.fromJson(Map<String, dynamic> json) = _$HabitoImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  @JsonKey(toJson: _$AffirmationToJson)
  Affirmation get affirmation;
  @override
  @JsonKey(name: 'regularity_days')
  List<String> get regularityDays;
  @override
  @JsonKey(name: 'daily_recurrence')
  int get dailyRecurrence;
  @override
  List<String> get reminders;
  @override
  int? get iconCode;
  @override
  @JsonKey(
      name: 'color_hex', fromJson: _colorHexFromJson, toJson: _colorHexToJson)
  int? get colorHex;
  @override
  @JsonKey(name: 'completed_dates')
  List<DateTime> get completedDates;
  @override
  @JsonKey(name: 'last_completed_at')
  DateTime? get lastCompletedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of Habito
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitoImplCopyWith<_$HabitoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Affirmation _$AffirmationFromJson(Map<String, dynamic> json) {
  return _Affirmation.fromJson(json);
}

/// @nodoc
mixin _$Affirmation {
  String get type => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this Affirmation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Affirmation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AffirmationCopyWith<Affirmation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffirmationCopyWith<$Res> {
  factory $AffirmationCopyWith(
          Affirmation value, $Res Function(Affirmation) then) =
      _$AffirmationCopyWithImpl<$Res, Affirmation>;
  @useResult
  $Res call({String type, String text});
}

/// @nodoc
class _$AffirmationCopyWithImpl<$Res, $Val extends Affirmation>
    implements $AffirmationCopyWith<$Res> {
  _$AffirmationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Affirmation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AffirmationImplCopyWith<$Res>
    implements $AffirmationCopyWith<$Res> {
  factory _$$AffirmationImplCopyWith(
          _$AffirmationImpl value, $Res Function(_$AffirmationImpl) then) =
      __$$AffirmationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String text});
}

/// @nodoc
class __$$AffirmationImplCopyWithImpl<$Res>
    extends _$AffirmationCopyWithImpl<$Res, _$AffirmationImpl>
    implements _$$AffirmationImplCopyWith<$Res> {
  __$$AffirmationImplCopyWithImpl(
      _$AffirmationImpl _value, $Res Function(_$AffirmationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Affirmation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
  }) {
    return _then(_$AffirmationImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AffirmationImpl implements _Affirmation {
  _$AffirmationImpl({required this.type, required this.text});

  factory _$AffirmationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AffirmationImplFromJson(json);

  @override
  final String type;
  @override
  final String text;

  @override
  String toString() {
    return 'Affirmation(type: $type, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AffirmationImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, text);

  /// Create a copy of Affirmation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AffirmationImplCopyWith<_$AffirmationImpl> get copyWith =>
      __$$AffirmationImplCopyWithImpl<_$AffirmationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AffirmationImplToJson(
      this,
    );
  }
}

abstract class _Affirmation implements Affirmation {
  factory _Affirmation(
      {required final String type,
      required final String text}) = _$AffirmationImpl;

  factory _Affirmation.fromJson(Map<String, dynamic> json) =
      _$AffirmationImpl.fromJson;

  @override
  String get type;
  @override
  String get text;

  /// Create a copy of Affirmation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AffirmationImplCopyWith<_$AffirmationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
