// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'projects.freezed.dart';
part 'projects.g.dart';

@freezed
abstract class Projects with _$Projects {
  const factory Projects({
    String? id,
    required Map<String, String> name,
    required Map<String, String> description,
    required String link,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'apk_url') String? apkUrl,
  }) = _Projects;

  factory Projects.fromJson(Map<String, dynamic> json) =>
      _$ProjectsFromJson(json);
}

extension ProjectsFirestore on Projects {
  static Projects fromDoc(QueryDocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Convertir los maps de dynamic a String con valores por defecto
    final nameData = data['name'] as Map<String, dynamic>? ?? {};
    final nameMap = nameData.map(
      (key, value) => MapEntry(key, value?.toString() ?? ''),
    );

    final descriptionData = data['description'] as Map<String, dynamic>? ?? {};
    final descriptionMap = descriptionData.map(
      (key, value) => MapEntry(key, value?.toString() ?? ''),
    );

    return Projects(
      id: doc.id,
      name: nameMap,
      description: descriptionMap,
      link: data['link'] as String? ?? '',
      imageUrl: data['image_url'] as String? ?? '',
      apkUrl: data['apk_url'] as String?,
    );
  }
}
