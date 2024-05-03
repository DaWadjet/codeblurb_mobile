import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/network/models/seen_status.dart';
import 'package:codeblurb_mobile/network/models/video_content_response.dart';
import 'package:codeblurb_mobile/pages/content/components/next_section_button.dart';
import 'package:codeblurb_mobile/pages/content/content_provider.dart';
import 'package:codeblurb_mobile/widgets/cb_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class VideoContentPage extends HookConsumerWidget {
  const VideoContentPage({
    required this.viewedContent,
    required this.courseId,
    super.key,
  });

  final VideoContentResponse viewedContent;
  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final YoutubePlayerController controller = useMemoized(
      () => YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
              'https://www.youtube.com/watch?v=Toar450Gk5Y',
            ) ??
            '',
      ),
    );

    final bottomPadding = context.bottomPadding;
    final isSeen = useState(viewedContent.status != SeenStatus.notSeen);
    final isCompleted = useState(viewedContent.status == SeenStatus.completed);

    useEffect(
      () {
        controller.addListener(() {
          if (controller.value.position.inSeconds > 0 && !isSeen.value) {
            isSeen.value = true;
            ref.read(contentNotifierProvider.notifier).markAsSeen(
                  courseId: courseId,
                  contentId: viewedContent.id,
                );
          }
          if (controller.value.position.inSeconds >
                  controller.metadata.duration.inSeconds * 0.9 &&
              !isCompleted.value) {
            isCompleted.value = true;
            ref.read(contentNotifierProvider.notifier).markAsCompleted(
                  courseId: courseId,
                  contentId: viewedContent.id,
                );
          }
        });
        return null;
      },
    );

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        bottomActions: [
          CurrentPosition(),
          ProgressBar(isExpanded: true),
          FullScreenButton(
            controller: controller,
          ),
        ],
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: CBAppBar(
            title: viewedContent.name,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                player,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 36),
                      const Text(
                        'Section Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        child: Text(
                          viewedContent.shortDescription,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                NextSectionButton(
                  courseId: courseId,
                  viewedContentId: viewedContent.id,
                  isOutlined: !isCompleted.value,
                ),
                SizedBox(height: bottomPadding + 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
