// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FieldModel {
  String name;
  String label;
  String? userInput;
  FieldModel({
    required this.name,
    required this.label,
    this.userInput = '',
  });

  FieldModel copyWith({
    String? name,
    String? label,
  }) {
    return FieldModel(
      name: name ?? this.name,
      label: label ?? this.label,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'label': label,
    };
  }

  factory FieldModel.fromMap(Map<String, dynamic> map) {
    return FieldModel(
      name: map['name'] as String,
      label: map['label'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FieldModel.fromJson(String source) =>
      FieldModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FieldModel(name: $name, label: $label)';

  @override
  bool operator ==(covariant FieldModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.label == label;
  }

  @override
  int get hashCode => name.hashCode ^ label.hashCode;
}
