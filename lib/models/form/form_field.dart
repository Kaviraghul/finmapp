// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fin_mapp/models/form/field.dart';

class FormFieldModel {
  String type;
  int version;
  FieldModel field;
  FormFieldModel({
    required this.type,
    required this.version,
    required this.field,
  });

  FormFieldModel copyWith({
    String? type,
    int? version,
    FieldModel? field,
  }) {
    return FormFieldModel(
      type: type ?? this.type,
      version: version ?? this.version,
      field: field ?? this.field,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'version': version,
      'schema': field.toMap(),
    };
  }

  factory FormFieldModel.fromMap(Map<String, dynamic> map) {
    return FormFieldModel(
      type: map['type'] as String,
      version: map['version'] as int,
      field: FieldModel.fromMap(map['schema'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FormFieldModel.fromJson(String source) =>
      FormFieldModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FormFieldModel(type: $type, version: $version, schema: $field)';

  @override
  bool operator ==(covariant FormFieldModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.version == version &&
        other.field == field;
  }

  @override
  int get hashCode => type.hashCode ^ version.hashCode ^ field.hashCode;
}
