// ignore_for_file: strict_raw_type

import 'package:form_builder_validators/form_builder_validators.dart';

typedef Validator<T> = String? Function(T? value);

abstract class Validators {
  static final Validator required = FormBuilderValidators.required(
    errorText: 'This field is required',
  );
  static final Validator<String> email = FormBuilderValidators.compose(
    [
      required,
      FormBuilderValidators.email(errorText: 'Invalid email address'),
    ],
  );

  static final password = FormBuilderValidators.compose(
    [
      required,
      // ignore: inference_failure_on_function_invocation
      FormBuilderValidators.minLength(
        8,
        errorText: 'Password must be at least 8 characters',
      ),
    ],
  );

  static Validator confirmPassword(String value) {
    return FormBuilderValidators.compose(
      [
        required,
        password,
        FormBuilderValidators.equal(
          value,
          errorText: 'Passwords must match',
        ),
      ],
    );
  }

  static Validator differentPassword(String value) {
    return FormBuilderValidators.compose(
      [
        required,
        password,
        FormBuilderValidators.notEqual(
          value,
          errorText: 'New password must be different',
        ),
      ],
    );
  }
}
