// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'education.freezed.dart';
part 'education.g.dart';

@freezed
abstract class Education with _$Education {
  const factory Education({
    String? id,
    required Map<String, String> name,
    required Map<String, String> title,
    required Map<String, String> instructor,
    required Map<String, String> duration,
    required List<String> skills,
    @JsonKey(name: 'image_url') required String imageUrl,
    required String link,
    @JsonKey(name: 'completion_date') required DateTime? completionDate,
    required int order,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}

extension EducationFirestore on Education {
  static Education fromDoc(QueryDocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Convertir los maps de dynamic a String con valores por defecto
    final nameData = data['name'] as Map<String, dynamic>? ?? {};
    final nameMap =
        nameData.map((key, value) => MapEntry(key, value?.toString() ?? ''));

    final titleData = data['title'] as Map<String, dynamic>? ?? {};
    final titleMap =
        titleData.map((key, value) => MapEntry(key, value?.toString() ?? ''));

    final instructorData = data['instructor'] as Map<String, dynamic>? ?? {};
    final instructorMap =
        instructorData.map((key, value) => MapEntry(key, value?.toString() ?? ''));

    final durationData = data['duration'] as Map<String, dynamic>? ?? {};
    final durationMap =
        durationData.map((key, value) => MapEntry(key, value?.toString() ?? ''));

    // Convertir skills de List<dynamic> a List<String>
    final skillsData = data['skills'] as List<dynamic>? ?? [];
    final skillsList = skillsData.map((e) => e?.toString() ?? '').toList();

    // Convertir Timestamp a DateTime
    final completionTimestamp = data['completion_date'] as Timestamp?;
    final completionDate = completionTimestamp?.toDate();

    return Education(
      id: doc.id,
      name: nameMap,
      title: titleMap,
      instructor: instructorMap,
      duration: durationMap,
      skills: skillsList,
      imageUrl: data['image_url'] as String? ?? '',
      link: data['link'] as String? ?? '',
      completionDate: completionDate,
      order: data['order'] as int? ?? 0,
    );
  }
}
