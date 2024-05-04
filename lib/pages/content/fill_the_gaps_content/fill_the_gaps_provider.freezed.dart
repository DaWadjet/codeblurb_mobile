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
  $Res call({bool isLoading});
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
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call({bool isLoading});
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
  }) {
    return _then(_$FillTheGapsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FillTheGapsStateImpl implements _FillTheGapsState {
  const _$FillTheGapsStateImpl({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'FillTheGapsState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FillTheGapsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FillTheGapsStateImplCopyWith<_$FillTheGapsStateImpl> get copyWith =>
      __$$FillTheGapsStateImplCopyWithImpl<_$FillTheGapsStateImpl>(
          this, _$identity);
}

abstract class _FillTheGapsState implements FillTheGapsState {
  const factory _FillTheGapsState({required final bool isLoading}) =
      _$FillTheGapsStateImpl;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$FillTheGapsStateImplCopyWith<_$FillTheGapsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
