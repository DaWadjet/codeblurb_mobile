// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fill_the_gaps_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FillTheGapsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<String> get editedSolutions => throw _privateConstructorUsedError;
  int get shownHints => throw _privateConstructorUsedError;
  int get tabControllerIndex => throw _privateConstructorUsedError;
  CodeQuizSolutionResponse? get solution => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FillTheGapsStateCopyWith<FillTheGapsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FillTheGapsStateCopyWith<$Res> {
  factory $FillTheGapsStateCopyWith(
          FillTheGapsState value, $Res Function(FillTheGapsState) then) =
      _$FillTheGapsStateCopyWithImpl<$Res, FillTheGapsState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<String> editedSolutions,
      int shownHints,
      int tabControllerIndex,
      CodeQuizSolutionResponse? solution});
}

/// @nodoc
class _$FillTheGapsStateCopyWithImpl<$Res, $Val extends FillTheGapsState>
    implements $FillTheGapsStateCopyWith<$Res> {
  _$FillTheGapsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? editedSolutions = null,
    Object? shownHints = null,
    Object? tabControllerIndex = null,
    Object? solution = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      editedSolutions: null == editedSolutions
          ? _value.editedSolutions
          : editedSolutions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shownHints: null == shownHints
          ? _value.shownHints
          : shownHints // ignore: cast_nullable_to_non_nullable
              as int,
      tabControllerIndex: null == tabControllerIndex
          ? _value.tabControllerIndex
          : tabControllerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      solution: freezed == solution
          ? _value.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as CodeQuizSolutionResponse?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FillTheGapsStateImplCopyWith<$Res>
    implements $FillTheGapsStateCopyWith<$Res> {
  factory _$$FillTheGapsStateImplCopyWith(_$FillTheGapsStateImpl value,
          $Res Function(_$FillTheGapsStateImpl) then) =
      __$$FillTheGapsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<String> editedSolutions,
      int shownHints,
      int tabControllerIndex,
      CodeQuizSolutionResponse? solution});
}

/// @nodoc
class __$$FillTheGapsStateImplCopyWithImpl<$Res>
    extends _$FillTheGapsStateCopyWithImpl<$Res, _$FillTheGapsStateImpl>
    implements _$$FillTheGapsStateImplCopyWith<$Res> {
  __$$FillTheGapsStateImplCopyWithImpl(_$FillTheGapsStateImpl _value,
      $Res Function(_$FillTheGapsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? editedSolutions = null,
    Object? shownHints = null,
    Object? tabControllerIndex = null,
    Object? solution = freezed,
  }) {
    return _then(_$FillTheGapsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      editedSolutions: null == editedSolutions
          ? _value._editedSolutions
          : editedSolutions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shownHints: null == shownHints
          ? _value.shownHints
          : shownHints // ignore: cast_nullable_to_non_nullable
              as int,
      tabControllerIndex: null == tabControllerIndex
          ? _value.tabControllerIndex
          : tabControllerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      solution: freezed == solution
          ? _value.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as CodeQuizSolutionResponse?,
    ));
  }
}

/// @nodoc

class _$FillTheGapsStateImpl implements _FillTheGapsState {
  const _$FillTheGapsStateImpl(
      {required this.isLoading,
      required final List<String> editedSolutions,
      this.shownHints = 0,
      this.tabControllerIndex = 0,
      this.solution})
      : _editedSolutions = editedSolutions;

  @override
  final bool isLoading;
  final List<String> _editedSolutions;
  @override
  List<String> get editedSolutions {
    if (_editedSolutions is EqualUnmodifiableListView) return _editedSolutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editedSolutions);
  }

  @override
  @JsonKey()
  final int shownHints;
  @override
  @JsonKey()
  final int tabControllerIndex;
  @override
  final CodeQuizSolutionResponse? solution;

  @override
  String toString() {
    return 'FillTheGapsState(isLoading: $isLoading, editedSolutions: $editedSolutions, shownHints: $shownHints, tabControllerIndex: $tabControllerIndex, solution: $solution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FillTheGapsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._editedSolutions, _editedSolutions) &&
            (identical(other.shownHints, shownHints) ||
                other.shownHints == shownHints) &&
            (identical(other.tabControllerIndex, tabControllerIndex) ||
                other.tabControllerIndex == tabControllerIndex) &&
            (identical(other.solution, solution) ||
                other.solution == solution));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_editedSolutions),
      shownHints,
      tabControllerIndex,
      solution);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FillTheGapsStateImplCopyWith<_$FillTheGapsStateImpl> get copyWith =>
      __$$FillTheGapsStateImplCopyWithImpl<_$FillTheGapsStateImpl>(
          this, _$identity);
}

abstract class _FillTheGapsState implements FillTheGapsState {
  const factory _FillTheGapsState(
      {required final bool isLoading,
      required final List<String> editedSolutions,
      final int shownHints,
      final int tabControllerIndex,
      final CodeQuizSolutionResponse? solution}) = _$FillTheGapsStateImpl;

  @override
  bool get isLoading;
  @override
  List<String> get editedSolutions;
  @override
  int get shownHints;
  @override
  int get tabControllerIndex;
  @override
  CodeQuizSolutionResponse? get solution;
  @override
  @JsonKey(ignore: true)
  _$$FillTheGapsStateImplCopyWith<_$FillTheGapsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
