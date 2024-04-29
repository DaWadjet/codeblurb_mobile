import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/pages/profile/profile_provider.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileNotifierProvider);

    final profileQuery = ref.watch(profileQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          profileQuery.when(
            data: (data) => Text('Data: $data'),
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(profileNotifierProvider.notifier).logout();
            },
            child: const Text('Logout'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(profileNotifierProvider.notifier).forceLogout();
            },
            child: const Text('forceLogout'),
          ),
          ElevatedButton(
            onPressed: () {
              context.router.push(ChangePasswordRoute());
            },
            child: const Text('changePassword'),
          ),
          const Center(
            child: Text('ProfilePage'),
          ),
        ],
      ),
    );
  }
}

String getMonogram(String username) {
  final splitted = username.split(' ');
  if (splitted.length == 1) return splitted[0].substring(0, 2).toUpperCase();
  return (splitted[0][0] + splitted[1][0]).toUpperCase();
}
