import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/login/login_provider.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/utils/validators.dart';
import 'package:codeblurb_mobile/widgets/input_field.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    final state = ref.watch(loginNotifierProvider);
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final maxHeight = MediaQuery.of(context).size.height;
    final topPadding = context.topPadding;
    final bottomPadding = context.bottomPadding;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FocusTraversalGroup(
                child: AutofillGroup(
                  child: SizedBox(
                    height: maxHeight - topPadding - bottomPadding,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.images.terminal.svg(
                                // ignore: deprecated_member_use_from_same_package
                                color: colors.primary,
                                width: 48,
                                height: 48,
                              ),
                              const Text(
                                'CodeBlurb',
                                style: TextStyle(
                                  fontSize: 36,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 60),
                          child: Text(
                            'Welcome back!',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputField(
                              key: const Key('input_username'),
                              controller: usernameController,
                              label: 'Username',
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.none,
                              validator: Validators.required,
                              textInputAction: TextInputAction.next,
                              autofillHints: const [
                                AutofillHints.username,
                              ],
                            ),
                            const SizedBox(height: 24),
                            InputField(
                              key: const Key('input_password'),
                              controller: passwordController,
                              isSecureField: true,
                              label: 'Password',
                              validator: Validators.password,
                              autofillHints: const [
                                AutofillHints.password,
                              ],
                              onSubmit: () => ref
                                  .read(loginNotifierProvider.notifier)
                                  .login(),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (!state.isLoading) {
                                      ref
                                          .read(
                                            loginNotifierProvider.notifier,
                                          )
                                          .login();
                                    }
                                  },
                                  child: state.isLoading
                                      ? const Loader(
                                          size: 32,
                                          withPrimaryColor: true,
                                        )
                                      : const Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: OutlinedButton(
                                  child: const Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onPressed: () => context.router
                                      .push(const RegisterRoute()),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: () => context.router
                                  .push(const RequestNewPasswordRoute()),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: colors.mutedForeground,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: bottomPadding + 20),
                      ].animate(interval: 100.ms).fadeIn(duration: 200.ms),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
