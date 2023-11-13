// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countersIndexHash() => r'c1ca3c418f4389cf35a11536b2a73357685247ad';

/// See also [CountersIndex].
@ProviderFor(CountersIndex)
final countersIndexProvider = NotifierProvider<CountersIndex, int>.internal(
  CountersIndex.new,
  name: r'countersIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countersIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CountersIndex = Notifier<int>;
String _$countersHash() => r'5a3ad23600c59d4d51d5e331f37c2f32b14c3b37';

/// See also [Counters].
@ProviderFor(Counters)
final countersProvider = NotifierProvider<Counters, List<int>>.internal(
  Counters.new,
  name: r'countersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$countersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Counters = Notifier<List<int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
