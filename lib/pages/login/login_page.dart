import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/pages/login/login_provider.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/utils/validators.dart';
import 'package:codeblurb_mobile/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginNotifierProvider);
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FocusTraversalGroup(
              child: AutofillGroup(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Welcome to CodeBlurb',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 24),
                    InputField(
                      key: const Key('input_username'),
                      controller: usernameController,
                      label: 'Username',
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.none,
                      validator: Validators.required,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.username],
                    ),
                    const SizedBox(height: 24),
                    InputField(
                      key: const Key('input_password'),
                      controller: passwordController,
                      isSecureField: true,
                      label: 'Password',
                      validator: Validators.password,
                      autofillHints: const [AutofillHints.password],
                      onSubmit: () =>
                          ref.read(loginNotifierProvider.notifier).login(),
                    ),
                    const SizedBox(height: 24),
                    const ElevatedButton(
                      onPressed: null,
                      child: Text('disabledElevated'),
                    ),
                    const TextButton(
                      onPressed: null,
                      child: Text('dummyTextButtondisabled'),
                    ),
                    const OutlinedButton(
                      onPressed: null,
                      child: Text('dummyOutlinedDisabled'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('dummyOutlined'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('dummyTextButton'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          ref.read(loginNotifierProvider.notifier).login(),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 24),
                    OutlinedButton(
                      child: const Text("Don't have an account?"),
                      onPressed: () =>
                          context.router.push(const RegisterRoute()),
                    ),
                  ],
                ),
              ),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,

              //   children: [
              //     const Text('LoginPage'),
              //     state.when(
              //       data: (data) => Text('Data: $data'),
              //       loading: () => const CircularProgressIndicator(),
              //       error: (error, stackTrace) => Text('Error: $error'),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         ref.read(loginNotifierProvider.notifier).login();
              //       },
              //       child: const Text('Login'),
              //     ),
              //     const Link(route: TabsRoute()),
              //     const Link(route: RegisterRoute()),
              //     const Link(route: RequestNewPasswordRoute()),
              //   ],
            ),
          ),
        ),
      ),
    );
  }
}
