// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_projects_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectsRepositoryHash() =>
    r'd2c45ecce9f4a931a68713b2425263083527dbe3';

/// See also [projectsRepository].
@ProviderFor(projectsRepository)
final projectsRepositoryProvider = Provider<RemoteProjectsRepository>.internal(
  projectsRepository,
  name: r'projectsRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$projectsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProjectsRepositoryRef = ProviderRef<RemoteProjectsRepository>;
String _$getProjectsHash() => r'6c3a593f651bca1ed7cf7bb4de870bd16cf849ed';

/// See also [getProjects].
@ProviderFor(getProjects)
final getProjectsProvider = FutureProvider<List<Projects>>.internal(
  getProjects,
  name: r'getProjectsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getProjectsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProjectsRef = FutureProviderRef<List<Projects>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
