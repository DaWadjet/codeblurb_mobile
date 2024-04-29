import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/profile/profile_provider.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    final profileQuery = ref.watch(profileQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: profileQuery.when(
          loading: () => const Expanded(
            key: ValueKey('loading'),
            child: Center(
              child: Loader(
                size: 48,
              ),
            ),
          ),
          data: (data) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              key: const ValueKey('loaded'),
              children: [
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 64,
                  backgroundColor: colors.mutedForeground.withOpacity(0.2),
                  child: Text(
                    getMonogram(data.username),
                    style: TextStyle(
                      color: colors.foreground,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  data.username,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.foreground,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      data.email,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Registered at',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      context.formatDate('YYYY/MM/DD', data.registeredAt),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                TextButton(
                  onPressed: () {
                    context.pushRoute(ChangePasswordRoute());
                  },
                  child: Row(
                    children: [
                      const Text(
                        'Change Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      RotatedBox(
                        quarterTurns: -1,
                        child: Assets.images.chevronDown.svg(
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        ref.read(profileNotifierProvider.notifier).logout();
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(profileNotifierProvider.notifier)
                            .forceLogout();
                      },
                      child: Text(
                        'Logout from all devices',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: colors.destructive,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          error: (error, stackTrace) => const Center(
            key: ValueKey('error'),
            child: Text('An error occurred. Please try again later.'),
          ),
        ),
      ),
    );
  }
}

String getMonogram(String username) {
  final splitted = username.split(' ');
  if (splitted.length == 1) return splitted[0].substring(0, 2).toUpperCase();
  return (splitted[0][0] + splitted[1][0]).toUpperCase();
}
