import 'package:fin_mapp/presentation/loan_detail_survey/loan_detail_survey.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinMapp application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FinMappLoanDetailsSurvey(),
    );
  }
}
