import 'package:codeblurb_mobile/data/content/models/coding_content_response.dart';
import 'package:codeblurb_mobile/data/content/models/quiz_content_response.dart';
import 'package:codeblurb_mobile/data/content/models/video_content_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'separated_content_bundle_response.g.dart';

@JsonSerializable(createToJson: false)
class SeparatedContentBundleResponse {
  SeparatedContentBundleResponse(
    this.includedVideos,
    this.includedCodingContent,
    this.includedQuizzes,
  );

  factory SeparatedContentBundleResponse.fromJson(Map<String, dynamic> json) =>
      _$SeparatedContentBundleResponseFromJson(json);
  final List<VideoContentResponse> includedVideos;
  @JsonKey(name: 'includedCodings')
  final List<CodingContentResponse> includedCodingContent;

  final List<QuizContentResponse> includedQuizzes;
}
