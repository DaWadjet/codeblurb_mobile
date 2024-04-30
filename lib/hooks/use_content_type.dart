import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/network/models/coding_content_type.dart';
import 'package:codeblurb_mobile/network/models/content_type.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';

(PageRouteInfo<dynamic>?, SvgGenImage) useContentType({
  required ContentType contentType,
  CodingContentType? codingContentType,
}) {
  switch (contentType) {
    case ContentType.quiz:
      return (const QuizContentRoute(), Assets.images.quiz);
    case ContentType.video:
      return (const VideoContentRoute(), Assets.images.video);
    case ContentType.article:
      return (const ArticleContentRoute(), Assets.images.article);
    case ContentType.coding:
      switch (codingContentType) {
        case CodingContentType.scratch:
          return (const ScratchContentRoute(), Assets.images.code);
        case CodingContentType.fillInTheGaps:
          return (const FillTheGapsContentRoute(), Assets.images.code);
        case CodingContentType.dragAndDrop:
          return (const DragAndDropContentRoute(), Assets.images.code);
        default:
          return (null, Assets.images.code);
      }
    default:
      throw ArgumentError('Unsupported content type');
  }
}
