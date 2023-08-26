// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fin_mapp/models/options/option_model.dart';
import 'package:flutter/foundation.dart';

class MultipleChoiceQuestionModel {
  String name;
  String label;
  bool hidden;
  bool readOnly;
  List<OptionModel>? options;
  MultipleChoiceQuestionModel({
    required this.name,
    required this.label,
    required this.hidden,
    required this.readOnly,
    required this.options,
  });

  MultipleChoiceQuestionModel copyWith({
    String? name,
    String? label,
    bool? hidden,
    bool? readOnly,
    List<OptionModel>? options,
  }) {
    return MultipleChoiceQuestionModel(
      name: name ?? this.name,
      label: label ?? this.label,
      hidden: hidden ?? this.hidden,
      readOnly: readOnly ?? this.readOnly,
      options: options ?? this.options,
    );
  }

  factory MultipleChoiceQuestionModel.fromMap(Map<String, dynamic> map) {
    return MultipleChoiceQuestionModel(
      name: map['name'] as String,
      label: map['label'] as String,
      hidden: map['hidden'] as bool,
      readOnly: map['readonly'] as bool,
      options: map['options'] != null
          ? List<OptionModel>.from(
              (map['options'] as List<dynamic>).map<OptionModel?>(
                (x) => OptionModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory MultipleChoiceQuestionModel.fromJson(String source) =>
      MultipleChoiceQuestionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MultipleChoiceQuestionModel(name: $name, label: $label, hidden: $hidden, readOnly: $readOnly, options: $options)';
  }

  @override
  bool operator ==(covariant MultipleChoiceQuestionModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.label == label &&
        other.hidden == hidden &&
        other.readOnly == readOnly &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        label.hashCode ^
        hidden.hashCode ^
        readOnly.hashCode ^
        options.hashCode;
  }
}
