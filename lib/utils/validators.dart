import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

typedef Validator<T> = String? Function(T? value);

abstract class Validators {
  static void onFocusChanged(
    BuildContext context,
    bool isFocused,
    String fieldName,
  ) {
    if (isFocused) {
      final field = FormBuilder.of(context)?.fields[fieldName];
      final value = field?.value;
      field
        ?..reset()
        ..didChange(value);
    } else {
      context.isFormFieldValid(fieldName);
    }
  }

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
