import 'package:codeblurb_mobile/data/models/content_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_content_response.g.dart';

@JsonSerializable(createToJson: false)
class VideoContentResponse {
  VideoContentResponse(this.name, this.description, this.resourceUrl);

  factory VideoContentResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoContentResponseFromJson(json);
  final String name;
  final String description;
  final String resourceUrl;

  ContentType get contentType => ContentType.video;
}
