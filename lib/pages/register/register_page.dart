import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/pages/register/register_provider.dart';
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

    final bottomPadding = context.bottomPadding;
    final topPadding = context.topPadding;

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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 48),
            child: CodeblurbLogo(),
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
                key: const Key('input_email'),
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
              const SizedBox(height: 16),
              InputField(
                key: const Key('input_password'),
                controller: passwordController,
                isSecureField: true,
                label: 'Password',
                validator: Validators.password,
                onChanged: (value) => passwordValue.value = value ?? '',
                autofillHints: const [
                  AutofillHints.password,
                ],
              ),
              const SizedBox(height: 16),
              InputField(
                key: const Key('input_confirm_password'),
                controller: confirmPasswordController,
                isSecureField: true,
                label: 'Confirm Password',
                textInputAction: TextInputAction.next,
                validator: Validators.confirmPassword(
                  passwordValue.value,
                ),
                autofillHints: const [
                  AutofillHints.password,
                ],
                onSubmit: onRegister,
              ),
              const SizedBox(height: 16),
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
                    onPressed: onRegister,
                    child: state.isLoading
                        ? const Loader(
                            size: 32,
                            withPrimaryColor: true,
                          )
                        : const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
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
                      'Already a member?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () => context.router.push(LoginRoute()),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: bottomPadding + 20),
        ],
      ),
    );
  }
}
