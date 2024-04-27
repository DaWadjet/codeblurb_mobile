import 'package:codeblurb_mobile/network/models/minimal_content_response.dart';
import 'package:codeblurb_mobile/network/models/ratings_response.dart';
import 'package:codeblurb_mobile/network/models/skill_level.dart';
import 'package:json_annotation/json_annotation.dart';

part 'minimal_content_bundle_response.g.dart';

@JsonSerializable(createToJson: false)
class MinimalContentBundleResponse {
  MinimalContentBundleResponse(
    this.includedContent,
    this.id,
    this.description,
    this.title,
    this.imageUrl,
    this.skillLevel,
    this.progress,
    this.releaseDate,
    this.ratings,
  );

  factory MinimalContentBundleResponse.fromJson(Map<String, dynamic> json) =>
      _$MinimalContentBundleResponseFromJson(json);

  final List<MinimalContentResponse> includedContent;
  final int id;
  final String description;
  final String title;
  final String? imageUrl;
  final SkillLevel skillLevel;
  final double progress;
  final DateTime releaseDate;
  final RatingsResponse ratings;
}
