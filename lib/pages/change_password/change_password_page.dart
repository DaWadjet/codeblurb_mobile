import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/pages/change_password/change_password_provider.dart';
import 'package:codeblurb_mobile/utils/validators.dart';
import 'package:codeblurb_mobile/widgets/form_page_wrapper.dart';
import 'package:codeblurb_mobile/widgets/input_field.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ChangePasswordPage extends HookConsumerWidget {
  ChangePasswordPage({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(changePasswordNotifierProvider);

    final oldPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmNewPasswordController = useTextEditingController();

    final bottomPadding = context.bottomPadding;

    final onPasswordChanged = useMemoized(
      () => () {
        if (state.isLoading) return;
        if (_formKey.currentState?.saveAndValidate() ?? false) {
          ref.read(changePasswordNotifierProvider.notifier).changePassword(
                oldPassword: oldPasswordController.text,
                newPassword: newPasswordController.text,
              );
        }
      },
      [ref, state.isLoading],
    );

    final newPasswordValue = useState('');
    final oldPasswordValue = useState('');

    return FormPageWrapper(
      formKey: _formKey,
      title: 'Change Password',
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(
                key: const Key('input_old_password'),
                controller: oldPasswordController,
                label: 'Old Password',
                textCapitalization: TextCapitalization.none,
                validator: Validators.password,
                textInputAction: TextInputAction.next,
                onChanged: (value) => oldPasswordValue.value = value ?? '',
                autofillHints: const [
                  AutofillHints.password,
                ],
                isSecureField: true,
              ),
              const SizedBox(height: 16),
              InputField(
                key: const Key('input_new_password'),
                controller: newPasswordController,
                isSecureField: true,
                label: 'New Password',
                validator: Validators.differentPassword(oldPasswordValue.value),
                onChanged: (value) => newPasswordValue.value = value ?? '',
                textInputAction: TextInputAction.next,
                autofillHints: const [
                  AutofillHints.password,
                ],
              ),
              const SizedBox(height: 16),
              InputField(
                key: const Key('input_confirm_new_password'),
                controller: confirmNewPasswordController,
                isSecureField: true,
                label: 'Confirm New Password',
                textInputAction: TextInputAction.next,
                validator: Validators.confirmPassword(
                  newPasswordValue.value,
                ),
                autofillHints: const [
                  AutofillHints.password,
                ],
                onSubmit: onPasswordChanged,
              ),
              const SizedBox(height: 16),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: ElevatedButton(
                onPressed: onPasswordChanged,
                child: state.isLoading
                    ? const Loader(
                        size: 32,
                        withPrimaryColor: true,
                      )
                    : const Text(
                        'Change Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(height: bottomPadding),
        ],
      ),
    );
  }
}
