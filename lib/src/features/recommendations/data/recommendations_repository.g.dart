// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendations_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recommendationsRepositoryHash() =>
    r'06e351a26089edb354fc70c479fabcacb2defea1';

/// See also [recommendationsRepository].
@ProviderFor(recommendationsRepository)
final recommendationsRepositoryProvider =
    Provider<RecommendationsRepository>.internal(
      recommendationsRepository,
      name: r'recommendationsRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$recommendationsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecommendationsRepositoryRef = ProviderRef<RecommendationsRepository>;
String _$getRecommendationsHash() =>
    r'a40f2f2c85f5c7547c851e978c3d0ece6f99c59a';

/// See also [getRecommendations].
@ProviderFor(getRecommendations)
final getRecommendationsProvider =
    FutureProvider<List<Recommendation>>.internal(
      getRecommendations,
      name: r'getRecommendationsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$getRecommendationsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetRecommendationsRef = FutureProviderRef<List<Recommendation>>;
String _$getPendingRecommendationsHash() =>
    r'32a06a2cfe33eb2e43f3478dee9cae77f025fcc2';

/// See also [getPendingRecommendations].
@ProviderFor(getPendingRecommendations)
final getPendingRecommendationsProvider =
    AutoDisposeFutureProvider<List<Recommendation>>.internal(
      getPendingRecommendations,
      name: r'getPendingRecommendationsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$getPendingRecommendationsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetPendingRecommendationsRef =
    AutoDisposeFutureProviderRef<List<Recommendation>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
