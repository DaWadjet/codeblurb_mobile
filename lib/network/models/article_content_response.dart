import 'package:codeblurb_mobile/network/models/content_type.dart';
import 'package:codeblurb_mobile/network/models/seen_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_content_response.g.dart';

@JsonSerializable(createToJson: false)
class ArticleContentResponse {
  ArticleContentResponse(
    this.id,
    this.name,
    this.contentType,
    this.status,
    this.estimatedTime,
    this.shortDescription,
    this.order,
    this.markdownText,
  );

  factory ArticleContentResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleContentResponseFromJson(json);

  final int id;
  final String name;
  final ContentType contentType;
  final SeenStatus status;
  final int estimatedTime;
  final String shortDescription;
  final int? order;
  final String markdownText;
}
