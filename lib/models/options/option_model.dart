// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OptionModel {
  String key;
  String value;
  OptionModel({
    required this.key,
    required this.value,
  });

  OptionModel copyWith({
    String? key,
    String? value,
  }) {
    return OptionModel(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'value': value,
    };
  }

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      key: map['key'] as String,
      value: map['value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionModel.fromJson(String source) =>
      OptionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OptionModel(key: $key, value: $value)';

  @override
  bool operator ==(covariant OptionModel other) {
    if (identical(this, other)) return true;

    return other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}
