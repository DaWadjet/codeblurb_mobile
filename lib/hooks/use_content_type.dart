import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/network/models/article_content_response.dart';
import 'package:codeblurb_mobile/network/models/coding_content_response.dart';
import 'package:codeblurb_mobile/network/models/coding_content_type.dart';
import 'package:codeblurb_mobile/network/models/content_type.dart';
import 'package:codeblurb_mobile/network/models/quiz_content_response.dart';
import 'package:codeblurb_mobile/network/models/video_content_response.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/types.dart';

typedef ContentTypeRouteBuilder = PageRouteInfo Function(Section);

(ContentTypeRouteBuilder?, SvgGenImage) useContentType({
  ContentType? contentType,
  CodingContentType? codingContentType,
}) {
  switch (contentType) {
    case ContentType.quiz:
      return (
        ((
          Section section,
        ) =>
            QuizContentRoute(
              viewedContent: section.content as QuizContentResponse,
              courseId: section.courseId,
            )),
        Assets.images.quiz,
      );
    case ContentType.video:
      return (
        (
          Section section,
        ) =>
            VideoContentRoute(
              viewedContent: section.content as VideoContentResponse,
              courseId: section.courseId,
            ),
        Assets.images.video
      );
    case ContentType.article:
      return (
        (
          Section section,
        ) =>
            ArticleContentRoute(
              viewedContent: section.content as ArticleContentResponse,
              courseId: section.courseId,
            ),
        Assets.images.article
      );
    case ContentType.coding:
      switch (codingContentType) {
        case CodingContentType.scratch:
          return (
            (
              Section section,
            ) =>
                ScratchContentRoute(
                  viewedContent: section.content as CodingContentResponse,
                  courseId: section.courseId,
                ),
            Assets.images.code
          );
        case CodingContentType.fillInTheGaps:
          return (
            (
              Section section,
            ) =>
                FillTheGapsContentRoute(
                  viewedContent: section.content as CodingContentResponse,
                  courseId: section.courseId,
                ),
            Assets.images.code
          );
        case CodingContentType.dragAndDrop:
          return (
            (
              Section section,
            ) =>
                DragAndDropContentRoute(
                  viewedContent: section.content as CodingContentResponse,
                  courseId: section.courseId,
                ),
            Assets.images.code
          );
        default:
          return (null, Assets.images.code);
      }
    default:
      return (null, Assets.images.code);
  }
}
