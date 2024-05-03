import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/network/models/article_content_response.dart';
import 'package:codeblurb_mobile/network/models/seen_status.dart';
import 'package:codeblurb_mobile/pages/content/components/next_section_button.dart';
import 'package:codeblurb_mobile/pages/content/content_provider.dart';
import 'package:codeblurb_mobile/widgets/cb_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ArticleContentPage extends HookConsumerWidget {
  const ArticleContentPage({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final ArticleContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSeen = useState(viewedContent.status != SeenStatus.notSeen);
    final isCompleted = useState(viewedContent.status == SeenStatus.completed);

    useEffect(
      () {
        Future.delayed(const Duration(milliseconds: 100), () {
          if (!isSeen.value) {
            ref.read(contentNotifierProvider.notifier).markAsSeen(
                  courseId: courseId,
                  contentId: viewedContent.id,
                );
          }
        });
        return null;
      },
    );

    final bottomPadding = context.bottomPadding;
    return Scaffold(
      appBar: CBAppBar(
        title: viewedContent.name,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            MarkdownBody(
              data: viewedContent.markdownText,
              onTapLink: (text, url, title) {
                if (url == null) return;
                launchUrl(Uri.parse(url));
              },
              extensionSet: md.ExtensionSet(
                md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                <md.InlineSyntax>[
                  md.EmojiSyntax(),
                  ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
                ],
              ),
            ),
            const SizedBox(height: 36),
            NextSectionButton(
              onNextContent: () {
                if (!isCompleted.value) {
                  ref.read(contentNotifierProvider.notifier).markAsCompleted(
                        courseId: courseId,
                        contentId: viewedContent.id,
                      );
                }
              },
              courseId: courseId,
              viewedContentId: viewedContent.id,
            ),
            SizedBox(height: bottomPadding + 10),
          ],
        ),
      ),
    );
  }
}
