import 'package:codeblurb_mobile/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputField extends StatefulWidget {
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
    this.prefix,
    this.suffixIcon,
    this.isSecureField = false,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.done,
    this.keyboardType,
    this.autofillHints,
    this.hintStyle,
    this.additionalInstructions,
    this.cursorColor,
    this.labelStyle = const TextStyle(
      fontWeight: FontWeight.w500,
    ),
    this.onSubmit,
    this.textCapitalization = TextCapitalization.sentences,
  });

  final String label;
  final Color? cursorColor;
  final String? initialValue;
  final String? hint;
  final String? errorText;
  final TextEditingController controller;
  final bool isDisabled;
  final VoidCallback? onSubmit;
  final ValueChanged<bool>? onFocusChanged;
  final ValueChanged<String?>? onChanged;
  final Validator<String>? validator;
  final Widget? prefix;
  final Widget? suffixIcon;
  final bool isSecureField;
  final int maxLines;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final TextStyle? hintStyle;
  final TextCapitalization textCapitalization;
  final TextStyle labelStyle;

  final Widget? additionalInstructions;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _isObscured = widget.isSecureField;

  void _toggleVisibility() => setState(() => _isObscured = !_isObscured);
  final _focusNode = FocusNode();
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: widget.additionalInstructions != null ? 0 : 8,
          ),
          child: Text(
            widget.label,
            style: widget.labelStyle,
          ),
        ),
        widget.additionalInstructions ?? const SizedBox(),
        const SizedBox(height: 6),
        Focus(
          focusNode: _focusNode,
          onFocusChange: widget.onFocusChanged,
          child: FormBuilderTextField(
            name: widget.label,
            controller: _controller,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            autofillHints: widget.autofillHints,
            readOnly: widget.isDisabled,
            obscureText: _isObscured,
            maxLines: widget.maxLines,
            validator: widget.validator,
            textCapitalization: widget.isSecureField
                ? TextCapitalization.none
                : widget.textCapitalization,
            decoration: InputDecoration(
              errorText: widget.errorText,
              hintText: widget.hint,
              hintStyle: widget.hintStyle,
              prefixIcon: widget.prefix,
              prefixIconConstraints: const BoxConstraints(maxHeight: 48),
              suffixIcon: widget.suffixIcon,
              suffix: widget.isSecureField
                  ? GestureDetector(
                      onTap: _toggleVisibility,
                      child: Text(
                        _isObscured ? 'show' : 'hide',
                      ),
                    )
                  : null,
            ),
            onChanged: widget.onChanged,
            onSubmitted: (_) => widget.onSubmit != null
                ? widget.onSubmit!.call()
                : _focusNode.nextFocus(),
          ),
        ),
      ],
    );
  }
}
