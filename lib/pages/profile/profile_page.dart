import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/pages/profile/profile_provider.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileNotifierProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          state.when(
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
