// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fin_mapp/models/loan_details/loan_question_factory.dart';
import 'package:flutter/foundation.dart';

class LoanDetails {
  String title;
  String name;
  String slug;
  String description;
  List<LoanQuestionFactory> questions;
  LoanDetails({
    required this.title,
    required this.name,
    required this.slug,
    required this.description,
    required this.questions,
  });

  LoanDetails copyWith({
    String? title,
    String? name,
    String? slug,
    String? description,
    List<LoanQuestionFactory>? questions,
  }) {
    return LoanDetails(
      title: title ?? this.title,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      questions: questions ?? this.questions,
    );
  }

  factory LoanDetails.fromMap(Map<String, dynamic> map) {
    return LoanDetails(
      title: map['title'] as String,
      name: map['name'] as String,
      slug: map['slug'] as String,
      description: map['description'] as String,
      questions: List<LoanQuestionFactory>.from(
        map['schema']['fields'].map<LoanQuestionFactory>(
          (x) => LoanQuestionFactory.fromMap(map: x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory LoanDetails.fromJson(String source) =>
      LoanDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoanDetails(title: $title, name: $name, slug: $slug, description: $description, questions: $questions)';
  }

  @override
  bool operator ==(covariant LoanDetails other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.name == name &&
        other.slug == slug &&
        other.description == description &&
        listEquals(other.questions, questions);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        description.hashCode ^
        questions.hashCode;
  }
}
