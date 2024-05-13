import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/login/login_provider.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/test/keys.dart';
import 'package:codeblurb_mobile/utils/validators.dart';
import 'package:codeblurb_mobile/widgets/form_page_wrapper.dart';
import 'package:codeblurb_mobile/widgets/input_field.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:codeblurb_mobile/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

    final bottomPadding = context.bottomPadding.h;
    final topPadding = context.topPadding.h;

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
      child: SizedBox(
        height: 690.h - bottomPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: topPadding,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.h),
                  child: const CodeblurbLogo(),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 36.h),
                  child: const Text(
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
                      key: Keys.login_usernameField,
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
                    SizedBox(height: 16.h),
                    InputField(
                      key: Keys.login_passwordField,
                      controller: passwordController,
                      isSecureField: true,
                      label: 'Password',
                      validator: Validators.required,
                      autofillHints: const [
                        AutofillHints.password,
                      ],
                      onSubmit: onLogin,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 44.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: ElevatedButton(
                      key: Keys.login_submit,
                      onPressed: onLogin,
                      child: state.isLoading
                          ? Loader(
                              size: 32.h,
                              withBackgroundColor: true,
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  height: 44.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: OutlinedButton(
                      key: Keys.login_signUp,
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () => context.router.push(RegisterRoute()),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                TextButton(
                  key: Keys.login_forgotPassword,
                  onPressed: () =>
                      context.router.push(RequestNewPasswordRoute()),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: colors.mutedForeground,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: bottomPadding + 10.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
