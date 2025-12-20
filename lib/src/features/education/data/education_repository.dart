import 'package:portafolio_app_web/src/features/education/domain/education.dart';

abstract class EducationRepository {
  Future<List<Education>> getEducation();
}
