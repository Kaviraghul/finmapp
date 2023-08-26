// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fin_mapp/models/single_select/single_select.dart';
import 'package:flutter/foundation.dart';

class SectionSingleSelect {
  String name;
  String label;
  bool hidden;
  bool readonly;
  List<SingleSelectModel> singleSelects;
  SectionSingleSelect({
    required this.name,
    required this.label,
    required this.hidden,
    required this.readonly,
    required this.singleSelects,
  });

  SectionSingleSelect copyWith({
    String? name,
    String? label,
    bool? hidden,
    bool? readonly,
    List<SingleSelectModel>? singleSelects,
  }) {
    return SectionSingleSelect(
      name: name ?? this.name,
      label: label ?? this.label,
      hidden: hidden ?? this.hidden,
      readonly: readonly ?? this.readonly,
      singleSelects: singleSelects ?? this.singleSelects,
    );
  }

  factory SectionSingleSelect.fromMap(Map<String, dynamic> map) {
    return SectionSingleSelect(
      name: map['name'] as String,
      label: map['label'] as String,
      hidden: map['hidden'] as bool,
      readonly: map['readonly'] as bool,
      singleSelects: List<SingleSelectModel>.from(
        map['fields'].map<SingleSelectModel>(
          (x) => SingleSelectModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory SectionSingleSelect.fromJson(String source) =>
      SectionSingleSelect.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SectionSingleSelect(name: $name, label: $label, hidden: $hidden, readonly: $readonly, singleSelects: $singleSelects)';
  }

  @override
  bool operator ==(covariant SectionSingleSelect other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.label == label &&
        other.hidden == hidden &&
        other.readonly == readonly &&
        listEquals(other.singleSelects, singleSelects);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        label.hashCode ^
        hidden.hashCode ^
        readonly.hashCode ^
        singleSelects.hashCode;
  }
}
