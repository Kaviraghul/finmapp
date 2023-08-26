import 'dart:convert';

import 'package:fin_mapp/models/form/form.dart';
import 'package:fin_mapp/models/section/section_single_select.dart';

class SectionFactory {
  final String type;
  const SectionFactory({
    required this.type,
  });

  factory SectionFactory.fromMap({
    required Map<String, dynamic> map,
  }) {
    String stringType = map['name'];
    switch (stringType) {
      case 'Section1':
        return SectionFormWrapper(
          model: FormModel.fromMap(map),
        );
      case 'Section2':
        return SectionSingleSelectWrapper(
          model: SectionSingleSelect.fromMap(map),
        );
      default:
        return SectionFormWrapper(
          model: FormModel.fromMap(map),
        );
    }
  }

  factory SectionFactory.fromJson(String source) =>
      SectionFactory.fromMap(map: json.decode(source) as Map<String, dynamic>);
}

class SectionFormWrapper extends SectionFactory {
  final FormModel model;
  SectionFormWrapper({required this.model}) : super(type: 'Section1');
}

class SectionSingleSelectWrapper extends SectionFactory {
  final SectionSingleSelect model;
  SectionSingleSelectWrapper({required this.model}) : super(type: 'Section2');
}
