// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingCartQueryHash() => r'eab6134eff54cdd924eb735680f7e98ff24b5cbe';

/// See also [shoppingCartQuery].
@ProviderFor(shoppingCartQuery)
final shoppingCartQueryProvider =
    AutoDisposeFutureProvider<ShoppingCartResponse>.internal(
  shoppingCartQuery,
  name: r'shoppingCartQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingCartQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ShoppingCartQueryRef
    = AutoDisposeFutureProviderRef<ShoppingCartResponse>;
String _$shoppingCartNotifierHash() =>
    r'b1bb3818ce39979949af5dc681b2cbb1ee83df44';

/// See also [ShoppingCartNotifier].
@ProviderFor(ShoppingCartNotifier)
final shoppingCartNotifierProvider = AutoDisposeNotifierProvider<
    ShoppingCartNotifier, AsyncValue<int?>>.internal(
  ShoppingCartNotifier.new,
  name: r'shoppingCartNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingCartNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShoppingCartNotifier = AutoDisposeNotifier<AsyncValue<int?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
