// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nextSectionHash() => r'6252b70cbca8e970daa2e47d2f0d7dbc893c64a8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [nextSection].
@ProviderFor(nextSection)
const nextSectionProvider = NextSectionFamily();

/// See also [nextSection].
class NextSectionFamily extends Family<Section?> {
  /// See also [nextSection].
  const NextSectionFamily();

  /// See also [nextSection].
  NextSectionProvider call({
    required int courseId,
    required int currentContentId,
  }) {
    return NextSectionProvider(
      courseId: courseId,
      currentContentId: currentContentId,
    );
  }

  @override
  NextSectionProvider getProviderOverride(
    covariant NextSectionProvider provider,
  ) {
    return call(
      courseId: provider.courseId,
      currentContentId: provider.currentContentId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'nextSectionProvider';
}

/// See also [nextSection].
class NextSectionProvider extends AutoDisposeProvider<Section?> {
  /// See also [nextSection].
  NextSectionProvider({
    required int courseId,
    required int currentContentId,
  }) : this._internal(
          (ref) => nextSection(
            ref as NextSectionRef,
            courseId: courseId,
            currentContentId: currentContentId,
          ),
          from: nextSectionProvider,
          name: r'nextSectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nextSectionHash,
          dependencies: NextSectionFamily._dependencies,
          allTransitiveDependencies:
              NextSectionFamily._allTransitiveDependencies,
          courseId: courseId,
          currentContentId: currentContentId,
        );

  NextSectionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseId,
    required this.currentContentId,
  }) : super.internal();

  final int courseId;
  final int currentContentId;

  @override
  Override overrideWith(
    Section? Function(NextSectionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NextSectionProvider._internal(
        (ref) => create(ref as NextSectionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseId: courseId,
        currentContentId: currentContentId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Section?> createElement() {
    return _NextSectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NextSectionProvider &&
        other.courseId == courseId &&
        other.currentContentId == currentContentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);
    hash = _SystemHash.combine(hash, currentContentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NextSectionRef on AutoDisposeProviderRef<Section?> {
  /// The parameter `courseId` of this provider.
  int get courseId;

  /// The parameter `currentContentId` of this provider.
  int get currentContentId;
}

class _NextSectionProviderElement extends AutoDisposeProviderElement<Section?>
    with NextSectionRef {
  _NextSectionProviderElement(super.provider);

  @override
  int get courseId => (origin as NextSectionProvider).courseId;
  @override
  int get currentContentId => (origin as NextSectionProvider).currentContentId;
}

String _$contentNotifierHash() => r'bc5f0c41117471bed8a0b482bc20f9c72a07a35f';

/// See also [ContentNotifier].
@ProviderFor(ContentNotifier)
final contentNotifierProvider =
    AutoDisposeNotifierProvider<ContentNotifier, AsyncValue<int?>>.internal(
  ContentNotifier.new,
  name: r'contentNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$contentNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ContentNotifier = AutoDisposeNotifier<AsyncValue<int?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
