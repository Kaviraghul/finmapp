// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fin_mapp/models/section/section_factory_model.dart';


class SectionModel {
  String type;
  int version;
  SectionFactory section;
  SectionModel({
    required this.type,
    required this.version,
    required this.section,
  });

  SectionModel copyWith({
    String? type,
    int? version,
    SectionFactory? section,
  }) {
    return SectionModel(
      type: type ?? this.type,
      version: version ?? this.version,
      section: section ?? this.section,
    );
  }

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      type: map['type'] as String,
      version: map['version'] as int,
      section:
          SectionFactory.fromMap(map: map['schema'] as Map<String, dynamic>),
    );
  }

  factory SectionModel.fromJson(String source) =>
      SectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SectionModel(type: $type, version: $version, section: $section)';

  @override
  bool operator ==(covariant SectionModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.version == version &&
        other.section == section;
  }

  @override
  int get hashCode => type.hashCode ^ version.hashCode ^ section.hashCode;
}
