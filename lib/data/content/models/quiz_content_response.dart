import 'package:codeblurb_mobile/data/content/models/quiz_question_response.dart';
import 'package:codeblurb_mobile/data/models/content_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_content_response.g.dart';

@JsonSerializable(createToJson: false)
class QuizContentResponse {
  QuizContentResponse(this.id, this.name, this.questions);

  factory QuizContentResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizContentResponseFromJson(json);
  final String name;
  final int id;
  final List<QuizQuestionResponse> questions;

  ContentType get contentType => ContentType.quiz;
}
