// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_props.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PageProps {
  String get label => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  Sort? get sort => throw _privateConstructorUsedError;
  List<String>? get skills => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagePropsCopyWith<PageProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagePropsCopyWith<$Res> {
  factory $PagePropsCopyWith(PageProps value, $Res Function(PageProps) then) =
      _$PagePropsCopyWithImpl<$Res, PageProps>;
  @useResult
  $Res call(
      {String label,
      int size,
      Sort? sort,
      List<String>? skills,
      String title,
      int page});

  $SortCopyWith<$Res>? get sort;
}

/// @nodoc
class _$PagePropsCopyWithImpl<$Res, $Val extends PageProps>
    implements $PagePropsCopyWith<$Res> {
  _$PagePropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? size = null,
    Object? sort = freezed,
    Object? skills = freezed,
    Object? title = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as Sort?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SortCopyWith<$Res>? get sort {
    if (_value.sort == null) {
      return null;
    }

    return $SortCopyWith<$Res>(_value.sort!, (value) {
      return _then(_value.copyWith(sort: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PagePropsImplCopyWith<$Res>
    implements $PagePropsCopyWith<$Res> {
  factory _$$PagePropsImplCopyWith(
          _$PagePropsImpl value, $Res Function(_$PagePropsImpl) then) =
      __$$PagePropsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      int size,
      Sort? sort,
      List<String>? skills,
      String title,
      int page});

  @override
  $SortCopyWith<$Res>? get sort;
}

/// @nodoc
class __$$PagePropsImplCopyWithImpl<$Res>
    extends _$PagePropsCopyWithImpl<$Res, _$PagePropsImpl>
    implements _$$PagePropsImplCopyWith<$Res> {
  __$$PagePropsImplCopyWithImpl(
      _$PagePropsImpl _value, $Res Function(_$PagePropsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? size = null,
    Object? sort = freezed,
    Object? skills = freezed,
    Object? title = null,
    Object? page = null,
  }) {
    return _then(_$PagePropsImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as Sort?,
      skills: freezed == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PagePropsImpl extends _PageProps {
  const _$PagePropsImpl(
      {required this.label,
      this.size = 10,
      this.sort,
      final List<String>? skills,
      this.title = '',
      this.page = 0})
      : _skills = skills,
        super._();

  @override
  final String label;
  @override
  @JsonKey()
  final int size;
  @override
  final Sort? sort;
  final List<String>? _skills;
  @override
  List<String>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'PageProps(label: $label, size: $size, sort: $sort, skills: $skills, title: $title, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagePropsImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, size, sort,
      const DeepCollectionEquality().hash(_skills), title, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PagePropsImplCopyWith<_$PagePropsImpl> get copyWith =>
      __$$PagePropsImplCopyWithImpl<_$PagePropsImpl>(this, _$identity);
}

abstract class _PageProps extends PageProps {
  const factory _PageProps(
      {required final String label,
      final int size,
      final Sort? sort,
      final List<String>? skills,
      final String title,
      final int page}) = _$PagePropsImpl;
  const _PageProps._() : super._();

  @override
  String get label;
  @override
  int get size;
  @override
  Sort? get sort;
  @override
  List<String>? get skills;
  @override
  String get title;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$PagePropsImplCopyWith<_$PagePropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Sort {
  String get property => throw _privateConstructorUsedError;
  bool get ascending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SortCopyWith<Sort> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortCopyWith<$Res> {
  factory $SortCopyWith(Sort value, $Res Function(Sort) then) =
      _$SortCopyWithImpl<$Res, Sort>;
  @useResult
  $Res call({String property, bool ascending});
}

/// @nodoc
class _$SortCopyWithImpl<$Res, $Val extends Sort>
    implements $SortCopyWith<$Res> {
  _$SortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? property = null,
    Object? ascending = null,
  }) {
    return _then(_value.copyWith(
      property: null == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as String,
      ascending: null == ascending
          ? _value.ascending
          : ascending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SortImplCopyWith<$Res> implements $SortCopyWith<$Res> {
  factory _$$SortImplCopyWith(
          _$SortImpl value, $Res Function(_$SortImpl) then) =
      __$$SortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String property, bool ascending});
}

/// @nodoc
class __$$SortImplCopyWithImpl<$Res>
    extends _$SortCopyWithImpl<$Res, _$SortImpl>
    implements _$$SortImplCopyWith<$Res> {
  __$$SortImplCopyWithImpl(_$SortImpl _value, $Res Function(_$SortImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? property = null,
    Object? ascending = null,
  }) {
    return _then(_$SortImpl(
      property: null == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as String,
      ascending: null == ascending
          ? _value.ascending
          : ascending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SortImpl implements _Sort {
  _$SortImpl({required this.property, required this.ascending});

  @override
  final String property;
  @override
  final bool ascending;

  @override
  String toString() {
    return 'Sort(property: $property, ascending: $ascending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortImpl &&
            (identical(other.property, property) ||
                other.property == property) &&
            (identical(other.ascending, ascending) ||
                other.ascending == ascending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, property, ascending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SortImplCopyWith<_$SortImpl> get copyWith =>
      __$$SortImplCopyWithImpl<_$SortImpl>(this, _$identity);
}

abstract class _Sort implements Sort {
  factory _Sort(
      {required final String property,
      required final bool ascending}) = _$SortImpl;

  @override
  String get property;
  @override
  bool get ascending;
  @override
  @JsonKey(ignore: true)
  _$$SortImplCopyWith<_$SortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
