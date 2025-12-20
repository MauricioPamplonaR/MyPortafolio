// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_education_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$educationRepositoryHash() =>
    r'822a73edeff114223dc044439eb0d353176097f5';

/// See also [educationRepository].
@ProviderFor(educationRepository)
final educationRepositoryProvider =
    Provider<RemoteEducationRepository>.internal(
      educationRepository,
      name: r'educationRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$educationRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EducationRepositoryRef = ProviderRef<RemoteEducationRepository>;
String _$getEducationHash() => r'be34ab7b75bdcac0f0b4d5cfdb72d2b0b26d16dc';

/// See also [getEducation].
@ProviderFor(getEducation)
final getEducationProvider = FutureProvider<List<Education>>.internal(
  getEducation,
  name: r'getEducationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getEducationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetEducationRef = FutureProviderRef<List<Education>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
