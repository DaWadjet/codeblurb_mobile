import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/hooks/use_content_type.dart';
import 'package:codeblurb_mobile/pages/content/content_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NextSectionButton extends HookConsumerWidget {
  const NextSectionButton({
    required this.courseId,
    required this.viewedContentId,
    this.onNextContent,
    this.isOutlined = false,
    super.key,
  });

  final int courseId;
  final int viewedContentId;
  final VoidCallback? onNextContent;
  final bool isOutlined;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextSection = ref.watch(
      nextSectionProvider(
        courseId: courseId,
        currentContentId: viewedContentId,
      ),
    );

    final (nextSectionRoute, _) = useContentType(
      contentType: nextSection?.contentType,
      codingContentType: nextSection?.codingContentType,
    );

    final onPressed = useMemoized(
      () => () {
        onNextContent?.call();
        if (nextSectionRoute != null) {
          context.router.replace(nextSectionRoute(nextSection!));
        } else {
          context.router.maybePop();
        }
      },
    );
    final child = Text(
      nextSectionRoute != null ? 'Next Section' : 'Back To Course',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
    return isOutlined
        ? OutlinedButton(
            onPressed: onPressed,
            child: child,
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: child,
          );
  }
}
