

import 'package:fin_mapp/models/section/section.dart';
import 'package:fin_mapp/models/single_choice_selector/single_choice_selector.dart';
import 'package:fin_mapp/models/single_select/single_select.dart';

class LoanQuestionFactory {
  String type;
  LoanQuestionFactory({required this.type});

  factory LoanQuestionFactory.fromMap({
    required Map<String, dynamic> map,
  }) {
    String questionType = map['type'];
    switch (questionType) {
      case 'SingleChoiceSelector':
        return LoanQuestionSingleChoiceSelectorWrapper(
          model: SingleChoiceSelectorModel.fromMap(map),
        );
      case 'SingleSelect':
        return LoanQuestionSingleSelectWrapper(
          model: SingleSelectModel.fromMap(map),
        );
      case 'Section':
        return LoanQuestionSectionWrapper(
          model: SectionModel.fromMap(map),
        );
      default:
        return LoanQuestionSingleChoiceSelectorWrapper(
          model: SingleChoiceSelectorModel.fromMap(map),
        );
    }
  }
}

class LoanQuestionSingleChoiceSelectorWrapper extends LoanQuestionFactory {
  SingleChoiceSelectorModel model;
  LoanQuestionSingleChoiceSelectorWrapper({required this.model})
      : super(type: 'SingleChoiceSelector');
}

class LoanQuestionSingleSelectWrapper extends LoanQuestionFactory {
  SingleSelectModel model;
  LoanQuestionSingleSelectWrapper({required this.model})
      : super(type: 'SingleSelect');
}

class LoanQuestionSectionWrapper extends LoanQuestionFactory {
  SectionModel model;
  LoanQuestionSectionWrapper({required this.model}) : super(type: 'Section');
}
