
import 'package:fin_mapp/data/data.dart';
import 'package:fin_mapp/models/loan_details/loan_details.dart';
import 'package:fin_mapp/models/loan_details/loan_question_factory.dart';
import 'package:fin_mapp/models/section/section.dart';
import 'package:fin_mapp/models/section/section_factory_model.dart';
import 'package:fin_mapp/models/single_select/single_select.dart';
import 'package:fin_mapp/presentation/loan_detail_survey/widgets/section_form_widget.dart';
import 'package:fin_mapp/presentation/loan_detail_survey/widgets/single_choice_selector.dart';
import 'package:fin_mapp/presentation/loan_detail_survey/widgets/single_select.dart';
import 'package:flutter/material.dart';

enum NavigationType { next, previous }

typedef UserResponseCallback = void Function(
    String questionId, String response);

class LoanDetailSurveyViewModel {
  LoanDetails surveyData = LoanDetails.fromJson(DummyData.homeLoanSchemaJson);
  List<Widget> surveyQuestionWidgets = [];
  List<Map<String, String>> userResponses = [];
  // final currentIndexController = BehaviorSubject<int>.seeded(0);
  // Stream<int> get currentIndexStream => currentIndexController.stream;
  // int get currentIndex => currentIndexController.value;

  ValueNotifier<int> activeIndex = ValueNotifier(0);

  List<Widget> getSurveyQuestionWidgetsList() {
    surveyQuestionWidgets = [];
    List<LoanQuestionFactory> questionData = surveyData.questions;
    questionData.forEach((question) {
      switch (question.type) {
        case 'SingleChoiceSelector':
          LoanQuestionSingleChoiceSelectorWrapper data =
              question as LoanQuestionSingleChoiceSelectorWrapper;
          surveyQuestionWidgets.add(
            SingleChoiceSelectorCard(
              key: Key(data.model.mcq.name),
              questionData: data.model,
              userResponseCallback: _updateUserResponse,
            ),
          );
          return;
        case 'SingleSelect':
          LoanQuestionSingleSelectWrapper data =
              question as LoanQuestionSingleSelectWrapper;
          surveyQuestionWidgets.add(SingleSelectCard(
            key: Key(data.model.mcq.name),
            questionData: data.model,
            userResponseCallback: _updateUserResponse,
          ));
          return;
        case 'Section':
          LoanQuestionSectionWrapper data =
              question as LoanQuestionSectionWrapper;
          addSectionWidgetsToList(data.model, surveyQuestionWidgets);
          return;
        default:
      }
    });
    return surveyQuestionWidgets;
  }

  void addSectionWidgetsToList(
    SectionModel model,
    List<Widget> list,
  ) {
    SectionFactory formWrapper = model.section;
    switch (formWrapper.type) {
      case 'Section1':
        SectionFormWrapper data = formWrapper as SectionFormWrapper;
        list.add(
          SectionFormWidget(
            key: Key(data.model.name),
            formData: data,
            userResponseCallback: _updateUserResponse,
          ),
        );
        break;
      case 'Section2':
        SectionSingleSelectWrapper data =
            formWrapper as SectionSingleSelectWrapper;
        _addSectionSingleSelectWidget(
            title: data.model.label,
            model: data.model.singleSelects,
            list: surveyQuestionWidgets);
        // list.add(
        //   SectionSingleSelectWidget(sectionData: data.model),
        // );
        break;
      default:
        null;
    }
  }

  void _addSectionSingleSelectWidget({
    String? title,
    required List<SingleSelectModel> model,
    required List<Widget> list,
  }) {
    model.forEach((element) {
      list.add(SectionSingleSelectWidget(
        key: Key(element.mcq.name),
        title: title!,
        questionData: element,
        userResponseCallback: _updateUserResponse,
      ));
    });
  }

  void _updateUserResponse(String question, String response) {
    if (response.isNotEmpty) {
      final existingResponseIndex =
          userResponses.indexWhere((element) => element.containsKey(question));
      if (existingResponseIndex != -1) {
        userResponses[existingResponseIndex][question] = response;
      } else {
        userResponses.add({question: response});
      }
    }
  }

  void _updateIndex(int index, NavigationType navigationType) {
    switch (navigationType) {
      case NavigationType.next:
        break;
      case NavigationType.previous:
        break;
      default:
    }
  }

  void dispose() {
    activeIndex.dispose();
  }
}

class SectionSingleSelectWidget extends StatefulWidget {
  final String title;
  final SingleSelectModel questionData;
  final UserResponseCallback userResponseCallback;
  const SectionSingleSelectWidget(
      {required this.title,
      required this.questionData,
      required this.userResponseCallback,
      super.key});

  @override
  State<SectionSingleSelectWidget> createState() =>
      _SectionSingleSelectWidgetState();
}

class _SectionSingleSelectWidgetState extends State<SectionSingleSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        Expanded(
          child: SingleSelectCard(
            questionData: widget.questionData,
            userResponseCallback: widget.userResponseCallback,
          ),
        ),
      ],
    );
  }
}
