import 'package:codeblurb_mobile/network/models/article_content_response.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/network/models/quiz_content_response.dart';
import 'package:codeblurb_mobile/network/models/ratings_response.dart';
import 'package:codeblurb_mobile/network/models/skill_level.dart';
import 'package:codeblurb_mobile/network/models/video_content_response.dart';
import 'package:codeblurb_mobile/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'separated_content_bundle_response.g.dart';

@JsonSerializable(createToJson: false)
class SeparatedContentBundleResponse {
  SeparatedContentBundleResponse(
    this.id,
    this.description,
    this.title,
    this.imageUrl,
    this.skillLevel,
    this.progress,
    this.releaseDate,
    this.ratings,
    this.numberOfPurchases,
    this.includedCodings,
    this.includedQuizzes,
    this.includedVideos,
    this.includedArticles,
  );

  factory SeparatedContentBundleResponse.fromJson(Map<String, dynamic> json) =>
      _$SeparatedContentBundleResponseFromJson(json);

  final List<CodingContentResponse> includedCodings;
  final List<QuizContentResponse> includedQuizzes;
  final List<VideoContentResponse> includedVideos;
  final List<ArticleContentResponse> includedArticles;
  final int id;
  final String description;
  final String title;
  final String? imageUrl;
  final SkillLevel skillLevel;
  final double progress;
  final DateTime releaseDate;
  final RatingsResponse ratings;
  final int numberOfPurchases;

  List<Section> get sections {
    final sections = [
      ...includedCodings.map(
        (e) => Section(
          name: e.name,
          shortDescription: e.shortDescription,
          estimatedTime: e.estimatedTime,
          contentType: e.contentType,
          codingContentType: e.codingContentType,
          status: e.status,
          order: e.order ?? 0,
        ),
      ),
      ...includedQuizzes.map(
        (e) => Section(
          name: e.name,
          shortDescription: e.shortDescription,
          estimatedTime: e.estimatedTime,
          contentType: e.contentType,
          status: e.status,
          order: e.order ?? 0,
        ),
      ),
      ...includedVideos.map(
        (e) => Section(
          name: e.name,
          shortDescription: e.shortDescription,
          estimatedTime: e.estimatedTime,
          contentType: e.contentType,
          status: e.status,
          order: e.order ?? 0,
        ),
      ),
      ...includedArticles.map(
        (e) => Section(
          name: e.name,
          shortDescription: e.shortDescription,
          estimatedTime: e.estimatedTime,
          contentType: e.contentType,
          status: e.status,
          order: e.order ?? 0,
        ),
      ),
    ]..sort((a, b) => a.order.compareTo(b.order));
    return sections;
  }
}
