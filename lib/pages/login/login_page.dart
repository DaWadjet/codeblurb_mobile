import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/login/login_provider.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/utils/validators.dart';
import 'package:codeblurb_mobile/widgets/form_page_wrapper.dart';
import 'package:codeblurb_mobile/widgets/input_field.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:codeblurb_mobile/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    final state = ref.watch(loginNotifierProvider);
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    final bottomPadding = context.bottomPadding;
    final topPadding = context.topPadding;

    final onLogin = useMemoized(
      () => () {
        if (state.isLoading) return;
        if (_formKey.currentState?.saveAndValidate() ?? false) {
          ref.read(loginNotifierProvider.notifier).login(
                username: usernameController.text,
                password: passwordController.text,
              );
        }
      },
      [ref, state.isLoading],
    );

    return FormPageWrapper(
      formKey: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: topPadding,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: CodeblurbLogo(),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 36),
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
              const SizedBox(height: 16),
              InputField(
                key: const Key('input_password'),
                controller: passwordController,
                isSecureField: true,
                label: 'Password',
                validator: Validators.password,
                autofillHints: const [
                  AutofillHints.password,
                ],
                onSubmit: onLogin,
              ),
              const SizedBox(height: 84),
            ],
          ),
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
                    onPressed: onLogin,
                    child: state.isLoading
                        ? const Loader(
                            size: 32,
                            withBackgroundColor: true,
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () => context.router.push(RegisterRoute()),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.router.push(RequestNewPasswordRoute()),
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
          SizedBox(height: bottomPadding + 10),
        ],
      ),
    );
  }
}
