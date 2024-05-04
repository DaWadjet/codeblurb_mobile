// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizContentState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<(int, int)> get answers => throw _privateConstructorUsedError;
  int get shownQuestionIndex => throw _privateConstructorUsedError;
  QuizSolutionResponse? get solution => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizContentStateCopyWith<QuizContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizContentStateCopyWith<$Res> {
  factory $QuizContentStateCopyWith(
          QuizContentState value, $Res Function(QuizContentState) then) =
      _$QuizContentStateCopyWithImpl<$Res, QuizContentState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<(int, int)> answers,
      int shownQuestionIndex,
      QuizSolutionResponse? solution});
}

/// @nodoc
class _$QuizContentStateCopyWithImpl<$Res, $Val extends QuizContentState>
    implements $QuizContentStateCopyWith<$Res> {
  _$QuizContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? answers = null,
    Object? shownQuestionIndex = null,
    Object? solution = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<(int, int)>,
      shownQuestionIndex: null == shownQuestionIndex
          ? _value.shownQuestionIndex
          : shownQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      solution: freezed == solution
          ? _value.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as QuizSolutionResponse?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizContentStateImplCopyWith<$Res>
    implements $QuizContentStateCopyWith<$Res> {
  factory _$$QuizContentStateImplCopyWith(_$QuizContentStateImpl value,
          $Res Function(_$QuizContentStateImpl) then) =
      __$$QuizContentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<(int, int)> answers,
      int shownQuestionIndex,
      QuizSolutionResponse? solution});
}

/// @nodoc
class __$$QuizContentStateImplCopyWithImpl<$Res>
    extends _$QuizContentStateCopyWithImpl<$Res, _$QuizContentStateImpl>
    implements _$$QuizContentStateImplCopyWith<$Res> {
  __$$QuizContentStateImplCopyWithImpl(_$QuizContentStateImpl _value,
      $Res Function(_$QuizContentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? answers = null,
    Object? shownQuestionIndex = null,
    Object? solution = freezed,
  }) {
    return _then(_$QuizContentStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<(int, int)>,
      shownQuestionIndex: null == shownQuestionIndex
          ? _value.shownQuestionIndex
          : shownQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      solution: freezed == solution
          ? _value.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as QuizSolutionResponse?,
    ));
  }
}

/// @nodoc

class _$QuizContentStateImpl implements _QuizContentState {
  const _$QuizContentStateImpl(
      {required this.isLoading,
      required final List<(int, int)> answers,
      required this.shownQuestionIndex,
      this.solution})
      : _answers = answers;

  @override
  final bool isLoading;
  final List<(int, int)> _answers;
  @override
  List<(int, int)> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final int shownQuestionIndex;
  @override
  final QuizSolutionResponse? solution;

  @override
  String toString() {
    return 'QuizContentState(isLoading: $isLoading, answers: $answers, shownQuestionIndex: $shownQuestionIndex, solution: $solution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizContentStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.shownQuestionIndex, shownQuestionIndex) ||
                other.shownQuestionIndex == shownQuestionIndex) &&
            (identical(other.solution, solution) ||
                other.solution == solution));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_answers),
      shownQuestionIndex,
      solution);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizContentStateImplCopyWith<_$QuizContentStateImpl> get copyWith =>
      __$$QuizContentStateImplCopyWithImpl<_$QuizContentStateImpl>(
          this, _$identity);
}

abstract class _QuizContentState implements QuizContentState {
  const factory _QuizContentState(
      {required final bool isLoading,
      required final List<(int, int)> answers,
      required final int shownQuestionIndex,
      final QuizSolutionResponse? solution}) = _$QuizContentStateImpl;

  @override
  bool get isLoading;
  @override
  List<(int, int)> get answers;
  @override
  int get shownQuestionIndex;
  @override
  QuizSolutionResponse? get solution;
  @override
  @JsonKey(ignore: true)
  _$$QuizContentStateImplCopyWith<_$QuizContentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
