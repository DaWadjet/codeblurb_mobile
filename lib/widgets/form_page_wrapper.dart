import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormPageWrapper extends StatelessWidget {
  const FormPageWrapper({
    required this.child,
    required this.formKey,
    this.title,
    super.key,
  });

  final Widget child;
  final GlobalKey<FormBuilderState> formKey;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final bottomPadding = context.bottomPadding;
    final topPadding = context.topPadding;

    return Scaffold(
      extendBodyBehindAppBar: title == null,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: title != null ? Text(title!) : const SizedBox.shrink(),
      ),
      extendBody: true,
      body: SafeArea(
        top: title != null,
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
                      height: maxHeight -
                          bottomPadding -
                          (title == null ? 0 : kToolbarHeight + topPadding),
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
