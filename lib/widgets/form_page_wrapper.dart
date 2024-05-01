import 'package:codeblurb_mobile/widgets/cb_app_bar.dart';
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
    return Scaffold(
      extendBodyBehindAppBar: title == null,
      appBar: CBAppBar(title: title),
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
                    child: child,
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
