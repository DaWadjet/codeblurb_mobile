// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drag_and_drop_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DragAndDropState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DragAndDropStateCopyWith<DragAndDropState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DragAndDropStateCopyWith<$Res> {
  factory $DragAndDropStateCopyWith(
          DragAndDropState value, $Res Function(DragAndDropState) then) =
      _$DragAndDropStateCopyWithImpl<$Res, DragAndDropState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$DragAndDropStateCopyWithImpl<$Res, $Val extends DragAndDropState>
    implements $DragAndDropStateCopyWith<$Res> {
  _$DragAndDropStateCopyWithImpl(this._value, this._then);

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
abstract class _$$DragAndDropStateImplCopyWith<$Res>
    implements $DragAndDropStateCopyWith<$Res> {
  factory _$$DragAndDropStateImplCopyWith(_$DragAndDropStateImpl value,
          $Res Function(_$DragAndDropStateImpl) then) =
      __$$DragAndDropStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$DragAndDropStateImplCopyWithImpl<$Res>
    extends _$DragAndDropStateCopyWithImpl<$Res, _$DragAndDropStateImpl>
    implements _$$DragAndDropStateImplCopyWith<$Res> {
  __$$DragAndDropStateImplCopyWithImpl(_$DragAndDropStateImpl _value,
      $Res Function(_$DragAndDropStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$DragAndDropStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DragAndDropStateImpl implements _DragAndDropState {
  const _$DragAndDropStateImpl({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'DragAndDropState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DragAndDropStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DragAndDropStateImplCopyWith<_$DragAndDropStateImpl> get copyWith =>
      __$$DragAndDropStateImplCopyWithImpl<_$DragAndDropStateImpl>(
          this, _$identity);
}

abstract class _DragAndDropState implements DragAndDropState {
  const factory _DragAndDropState({required final bool isLoading}) =
      _$DragAndDropStateImpl;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$DragAndDropStateImplCopyWith<_$DragAndDropStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
