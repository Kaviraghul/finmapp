// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fin_mapp/models/multiple_choice_question/multiple_choice_question.dart';

class SingleChoiceSelectorModel {
  String type;
  int version;
  MultipleChoiceQuestionModel mcq;
  String? selectedOption;
  SingleChoiceSelectorModel({
    required this.type,
    required this.version,
    required this.mcq,
    this.selectedOption = '',
  });

  SingleChoiceSelectorModel copyWith({
    String? type,
    int? version,
    MultipleChoiceQuestionModel? mcq,
  }) {
    return SingleChoiceSelectorModel(
      type: type ?? this.type,
      version: version ?? this.version,
      mcq: mcq ?? this.mcq,
    );
  }

  factory SingleChoiceSelectorModel.fromMap(Map<String, dynamic> map) {
    return SingleChoiceSelectorModel(
      type: map['type'] as String,
      version: map['version'] as int,
      mcq: MultipleChoiceQuestionModel.fromMap(
          map['schema'] as Map<String, dynamic>),
    );
  }

  factory SingleChoiceSelectorModel.fromJson(String source) =>
      SingleChoiceSelectorModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SingleChoiceSelectorModel(type: $type, version: $version, mcq: $mcq)';

  @override
  bool operator ==(covariant SingleChoiceSelectorModel other) {
    if (identical(this, other)) return true;

    return other.type == type && other.version == version && other.mcq == mcq;
  }

  @override
  int get hashCode => type.hashCode ^ version.hashCode ^ mcq.hashCode;
}
