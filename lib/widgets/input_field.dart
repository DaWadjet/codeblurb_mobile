import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InputField extends HookWidget {
  const InputField({
    required this.label,
    required this.controller,
    super.key,
    this.initialValue,
    this.hint,
    this.errorText,
    this.isDisabled = false,
    this.onChanged,
    this.onFocusChanged,
    this.validator,
    this.isSecureField = false,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.done,
    this.keyboardType,
    this.autofillHints,
    this.hintStyle,
    this.labelStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    this.onSubmit,
    this.textCapitalization = TextCapitalization.sentences,
  });

  final String label;
  final String? initialValue;
  final String? hint;
  final String? errorText;
  final TextEditingController controller;
  final bool isDisabled;
  final VoidCallback? onSubmit;
  final ValueChanged<bool>? onFocusChanged;
  final ValueChanged<String?>? onChanged;
  final Validator<String>? validator;
  final bool isSecureField;
  final int maxLines;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final TextStyle? hintStyle;
  final TextCapitalization textCapitalization;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final colors = useColors();
    final isObscured = useState(isSecureField);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle,
        ),
        const SizedBox(height: 10),
        Focus(
          focusNode: focusNode,
          onFocusChange: onFocusChanged,
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: FormBuilderTextField(
              name: label,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              autofillHints: autofillHints,
              readOnly: isDisabled,
              obscureText: isObscured.value,
              maxLines: maxLines,
              validator: validator,
              textCapitalization:
                  isSecureField ? TextCapitalization.none : textCapitalization,
              decoration: InputDecoration(
                errorText: errorText,
                hintText: hint,
                hintStyle: hintStyle,
                suffixIcon: isSecureField
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          icon: isObscured.value
                              ? Assets.images.eye
                                  .svg(color: colors.mutedForeground)
                              : Assets.images.eyeoff
                                  .svg(color: colors.mutedForeground),
                          onPressed: () => isObscured.value = !isObscured.value,
                        ),
                      )
                    : null,
              ),
              onChanged: onChanged,
              onSubmitted: (_) =>
                  onSubmit != null ? onSubmit!.call() : focusNode.nextFocus(),
            ),
          ),
        ),
      ],
    );
  }
}
