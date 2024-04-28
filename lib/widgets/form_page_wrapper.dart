import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormPageWrapper extends StatelessWidget {
  const FormPageWrapper({
    required this.child,
    required this.formKey,
    super.key,
  });

  final Widget child;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final topPadding = context.topPadding;
    final bottomPadding = context.bottomPadding;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FocusTraversalGroup(
                child: FormBuilder(
                  key: formKey,
                  child: AutofillGroup(
                    child: SizedBox(
                      height: maxHeight - topPadding - bottomPadding,
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
