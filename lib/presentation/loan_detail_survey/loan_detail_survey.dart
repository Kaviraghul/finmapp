
import 'package:fin_mapp/presentation/loan_detail_survey/loan_detail_survey_view.model.dart';
import 'package:fin_mapp/presentation/user_response/user_response.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class FinMappLoanDetailsSurvey extends StatefulWidget {
  const FinMappLoanDetailsSurvey({super.key});

  @override
  State<FinMappLoanDetailsSurvey> createState() =>
      _FinMappLoanDetailsSurveyState();
}

class _FinMappLoanDetailsSurveyState extends State<FinMappLoanDetailsSurvey> {
  final LoanDetailSurveyViewModel _viewModel = LoanDetailSurveyViewModel();

  @override
  Widget build(BuildContext context) {
    final questionsWidgetList = _viewModel.getSurveyQuestionWidgetsList();
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            if (_viewModel.activeIndex.value > 0) {
              _viewModel.activeIndex.value--;
            }
            return Future.value(false);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _viewModel.surveyData.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ValueListenableBuilder(
                  valueListenable: _viewModel.activeIndex,
                  builder: (context, currentIndex, child) {
                    return StepProgressIndicator(
                      selectedColor: Colors.green,
                      totalSteps: questionsWidgetList.length,
                      currentStep: _viewModel.activeIndex.value + 1,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ValueListenableBuilder<int>(
                      valueListenable: _viewModel.activeIndex,
                      builder: (context, currentIndex, child) {
                        return questionsWidgetList[
                            _viewModel.activeIndex.value];
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder(
                  valueListenable: _viewModel.activeIndex,
                  builder: (context, currentIndex, child) {
                    return _viewModel.activeIndex.value != 0
                        ? TextButton(
                            onPressed: () {
                              _viewModel.activeIndex.value--;
                            },
                            child: const  Row(
                              children:  [
                                Icon(
                                  Icons.chevron_left,
                                  size: 25,
                                  weight: 10,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Back',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ))
                        : const SizedBox.shrink();
                  }),
              ElevatedButton(
                onPressed: () {
                  if (_viewModel.activeIndex.value ==
                      questionsWidgetList.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserResponseScreen(
                            userResponses: _viewModel.userResponses),
                      ),
                    );
                  }
                  if (_viewModel.activeIndex.value <
                      questionsWidgetList.length - 1) {
                    _viewModel.activeIndex.value++;
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                ),
                child: const Icon(
                  Icons.chevron_right,
                  size: 40,
                ),
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
