import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/pages/request_new_password/request_new_password_provider.dart';
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
class RequestNewPasswordPage extends HookConsumerWidget {
  RequestNewPasswordPage({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(requestNewPasswordNotifierProvider);
    final usernameController = useTextEditingController();

    final bottomPadding = context.bottomPadding.h;
    final topPadding = context.topPadding.h;

    final onSendRequest = useMemoized(
      () => () {
        if (state.isLoading) return;
        if (_formKey.currentState?.saveAndValidate() ?? false) {
          ref
              .read(requestNewPasswordNotifierProvider.notifier)
              .requestPasswordResetEmail(
                username: usernameController.text,
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
                const Text(
                  'Enter your username below to receive a password reset email!',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16.h),
                InputField(
                  key: const Key('input_username'),
                  controller: usernameController,
                  hint: 'Username',
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.none,
                  validator: Validators.required,
                  onSubmit: onSendRequest,
                  autofillHints: const [
                    AutofillHints.username,
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
                      onPressed: onSendRequest,
                      child: state.isLoading
                          ? const Loader(
                              size: 32,
                              withBackgroundColor: true,
                            )
                          : Text(
                              'Send Reset Email',
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
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () => context.router.maybePop(),
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
