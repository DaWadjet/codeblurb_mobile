// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scratch_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScratchState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  int get shownHints => throw _privateConstructorUsedError;
  int get tabControllerIndex => throw _privateConstructorUsedError;
  CodeSolutionResponse? get solution => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScratchStateCopyWith<ScratchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScratchStateCopyWith<$Res> {
  factory $ScratchStateCopyWith(
          ScratchState value, $Res Function(ScratchState) then) =
      _$ScratchStateCopyWithImpl<$Res, ScratchState>;
  @useResult
  $Res call(
      {bool isLoading,
      String code,
      int shownHints,
      int tabControllerIndex,
      CodeSolutionResponse? solution});
}

/// @nodoc
class _$ScratchStateCopyWithImpl<$Res, $Val extends ScratchState>
    implements $ScratchStateCopyWith<$Res> {
  _$ScratchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? code = null,
    Object? shownHints = null,
    Object? tabControllerIndex = null,
    Object? solution = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
              as CodeSolutionResponse?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScratchStateImplCopyWith<$Res>
    implements $ScratchStateCopyWith<$Res> {
  factory _$$ScratchStateImplCopyWith(
          _$ScratchStateImpl value, $Res Function(_$ScratchStateImpl) then) =
      __$$ScratchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String code,
      int shownHints,
      int tabControllerIndex,
      CodeSolutionResponse? solution});
}

/// @nodoc
class __$$ScratchStateImplCopyWithImpl<$Res>
    extends _$ScratchStateCopyWithImpl<$Res, _$ScratchStateImpl>
    implements _$$ScratchStateImplCopyWith<$Res> {
  __$$ScratchStateImplCopyWithImpl(
      _$ScratchStateImpl _value, $Res Function(_$ScratchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? code = null,
    Object? shownHints = null,
    Object? tabControllerIndex = null,
    Object? solution = freezed,
  }) {
    return _then(_$ScratchStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
              as CodeSolutionResponse?,
    ));
  }
}

/// @nodoc

class _$ScratchStateImpl implements _ScratchState {
  const _$ScratchStateImpl(
      {required this.isLoading,
      required this.code,
      this.shownHints = 0,
      this.tabControllerIndex = 0,
      this.solution});

  @override
  final bool isLoading;
  @override
  final String code;
  @override
  @JsonKey()
  final int shownHints;
  @override
  @JsonKey()
  final int tabControllerIndex;
  @override
  final CodeSolutionResponse? solution;

  @override
  String toString() {
    return 'ScratchState(isLoading: $isLoading, code: $code, shownHints: $shownHints, tabControllerIndex: $tabControllerIndex, solution: $solution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScratchStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.shownHints, shownHints) ||
                other.shownHints == shownHints) &&
            (identical(other.tabControllerIndex, tabControllerIndex) ||
                other.tabControllerIndex == tabControllerIndex) &&
            (identical(other.solution, solution) ||
                other.solution == solution));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, code, shownHints, tabControllerIndex, solution);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScratchStateImplCopyWith<_$ScratchStateImpl> get copyWith =>
      __$$ScratchStateImplCopyWithImpl<_$ScratchStateImpl>(this, _$identity);
}

abstract class _ScratchState implements ScratchState {
  const factory _ScratchState(
      {required final bool isLoading,
      required final String code,
      final int shownHints,
      final int tabControllerIndex,
      final CodeSolutionResponse? solution}) = _$ScratchStateImpl;

  @override
  bool get isLoading;
  @override
  String get code;
  @override
  int get shownHints;
  @override
  int get tabControllerIndex;
  @override
  CodeSolutionResponse? get solution;
  @override
  @JsonKey(ignore: true)
  _$$ScratchStateImplCopyWith<_$ScratchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
