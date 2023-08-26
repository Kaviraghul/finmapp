// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fin_mapp/models/form/form_field.dart';
import 'package:flutter/foundation.dart';

class FormModel {
  String name;
  String label;
  List<FormFieldModel> formFields;
  FormModel({
    required this.name,
    required this.label,
    required this.formFields,
  });

  FormModel copyWith({
    String? name,
    String? label,
    List<FormFieldModel>? formFields,
  }) {
    return FormModel(
      name: name ?? this.name,
      label: label ?? this.label,
      formFields: formFields ?? this.formFields,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'label': label,
      'formFields': formFields.map((x) => x.toMap()).toList(),
    };
  }

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      name: map['name'] as String,
      label: map['label'] as String,
      formFields: List<FormFieldModel>.from(
        map['fields'].map<FormFieldModel>(
          (x) => FormFieldModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FormModel.fromJson(String source) =>
      FormModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FormModel(name: $name, label: $label, formFields: $formFields)';

  @override
  bool operator ==(covariant FormModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.label == label &&
        listEquals(other.formFields, formFields);
  }

  @override
  int get hashCode => name.hashCode ^ label.hashCode ^ formFields.hashCode;
}
