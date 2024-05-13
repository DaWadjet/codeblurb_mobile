import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/pages/register/register_provider.dart';
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
class RegisterPage extends HookConsumerWidget {
  RegisterPage({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerNotifierProvider);

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final emailController = useTextEditingController();

    final bottomPadding = context.bottomPadding.h;
    final topPadding = context.topPadding.h;

    final onRegister = useMemoized(
      () => () {
        if (state.isLoading) return;
        if (_formKey.currentState?.saveAndValidate() ?? false) {
          ref.read(registerNotifierProvider.notifier).register(
                username: usernameController.text,
                password: passwordController.text,
                email: emailController.text,
              );
        }
      },
      [ref, state.isLoading],
    );

    final passwordValue = useState('');

    return FormPageWrapper(
      formKey: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: topPadding,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: const CodeblurbLogo(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(
                key: Keys.register_usernameField,
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
                key: Keys.register_emailField,
                controller: emailController,
                label: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                validator: Validators.email,
                textInputAction: TextInputAction.next,
                autofillHints: const [
                  AutofillHints.email,
                ],
              ),
              SizedBox(height: 16.h),
              InputField(
                key: Keys.register_passwordField,
                controller: passwordController,
                isSecureField: true,
                label: 'Password',
                validator: Validators.password,
                textInputAction: TextInputAction.next,
                onChanged: (value) => passwordValue.value = value ?? '',
                autofillHints: const [
                  AutofillHints.password,
                ],
              ),
              SizedBox(height: 16.h),
              InputField(
                key: Keys.register_confirmPasswordField,
                controller: confirmPasswordController,
                isSecureField: true,
                label: 'Confirm Password',
                validator: Validators.confirmPassword(
                  passwordValue.value,
                ),
                autofillHints: const [
                  AutofillHints.password,
                ],
                onSubmit: onRegister,
              ),
              SizedBox(height: 44.h),
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
                    key: Keys.register_submit,
                    onPressed: onRegister,
                    child: state.isLoading
                        ? Loader(
                            size: 32.h,
                            withBackgroundColor: true,
                          )
                        : Text(
                            'Register',
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
                    onPressed: context.router.maybePop,
                    child: Text(
                      'Already a member?',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: bottomPadding + 10.h),
        ],
      ),
    );
  }
}
