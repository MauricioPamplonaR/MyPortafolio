import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolio_app_web/src/features/education/data/education_repository.dart';
import 'package:portafolio_app_web/src/features/education/domain/education.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_education_repository.g.dart';

class RemoteEducationRepository extends EducationRepository {
  final FirebaseFirestore db;

  RemoteEducationRepository({required this.db});

  @override
  Future<List<Education>> getEducation() async {
    final education = await db
        .collection('education')
        .orderBy('order')
        .get(const GetOptions(source: Source.serverAndCache));
    final educationList = education.docs
        .map((doc) => EducationFirestore.fromDoc(doc))
        .toList();
    return educationList;
  }
}

@Riverpod(keepAlive: true)
RemoteEducationRepository educationRepository(Ref ref) {
  final firestore = FirebaseFirestore.instance;
  return RemoteEducationRepository(db: firestore);
}

@Riverpod(keepAlive: true)
Future<List<Education>> getEducation(Ref ref) {
  final repository = ref.read(educationRepositoryProvider);
  return repository.getEducation();
}
