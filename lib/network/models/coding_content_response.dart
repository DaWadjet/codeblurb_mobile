import 'package:codeblurb_mobile/network/models/coding_content_type.dart';
import 'package:codeblurb_mobile/network/models/content_type.dart';
import 'package:codeblurb_mobile/network/models/seen_status.dart';
import 'package:codeblurb_mobile/network/models/test_case_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coding_content_response.g.dart';

@JsonSerializable(createToJson: false)
class CodingContentResponse {
  CodingContentResponse(
    this.id,
    this.name,
    this.contentType,
    this.status,
    this.estimatedTime,
    this.shortDescription,
    this.order,
    this.description,
    this.codingContentType,
    this.codeSnippets,
    this.codeSkeleton,
    this.testCases,
    this.hints,
  );

  factory CodingContentResponse.fromJson(Map<String, dynamic> json) =>
      _$CodingContentResponseFromJson(json);

  final int id;
  final String name;
  final ContentType contentType;
  final SeenStatus status;
  final int estimatedTime;
  final String shortDescription;
  final int? order;
  final String? description;
  final CodingContentType codingContentType;
  final List<String> codeSnippets;
  final List<String> codeSkeleton;
  final List<TestCaseResponse>? testCases;
  final List<String> hints;
}
