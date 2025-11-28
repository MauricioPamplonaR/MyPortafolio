import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolio_app_web/src/features/projects/data/projects_repository.dart';
import 'package:portafolio_app_web/src/features/projects/domain/projects.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_projects_repository.g.dart';

class RemoteProjectsRepository extends ProjectsRepository {
  final FirebaseFirestore db;

  RemoteProjectsRepository({required this.db});

  @override
  Future<List<Projects>> getProjects() async {
    final projects = await db
        .collection('projects')
        .get(const GetOptions(source: Source.serverAndCache));
    final projectsList = projects.docs
        .map((doc) => ProjectsFirestore.fromDoc(doc))
        .toList();
    return projectsList;
  }
}

@Riverpod(keepAlive: true)
RemoteProjectsRepository projectsRepository(Ref ref) {
  final firestore = FirebaseFirestore.instance;
  return RemoteProjectsRepository(db: firestore);
}

@Riverpod(keepAlive: true)
Future<List<Projects>> getProjects(Ref ref) {
  final repository = ref.read(projectsRepositoryProvider);
  return repository.getProjects();
}