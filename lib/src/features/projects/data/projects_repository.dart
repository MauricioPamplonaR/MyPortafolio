import 'package:portafolio_app_web/src/features/projects/domain/projects.dart';

abstract class ProjectsRepository {
  Future<List<Projects>> getProjects();
} 