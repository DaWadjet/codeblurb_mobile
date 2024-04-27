import 'package:codeblurb_mobile/network/models/content_type.dart';
import 'package:codeblurb_mobile/network/models/quiz_question_response.dart';
import 'package:codeblurb_mobile/network/models/seen_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_content_response.g.dart';

@JsonSerializable(createToJson: false)
class QuizContentResponse {
  QuizContentResponse(
    this.id,
    this.name,
    this.contentType,
    this.status,
    this.estimatedTime,
    this.shortDescription,
    this.order,
    this.questions,
  );

  factory QuizContentResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizContentResponseFromJson(json);

  final int id;
  final String name;
  final ContentType contentType;
  final SeenStatus status;
  final int estimatedTime;
  final String shortDescription;
  final int? order;
  final List<QuizQuestionResponse> questions;
}
