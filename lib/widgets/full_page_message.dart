import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';

class FullPageLoader extends StatelessWidget {
  const FullPageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    final hasAppBar = Scaffold.of(context).hasAppBar;

    return Padding(
      padding: EdgeInsets.only(
        top: fullHeight / 3 + (hasAppBar ? 0 : kToolbarHeight),
      ),
      child: const Center(
        key: ValueKey('loading'),
        child: Loader(
          size: 48,
        ),
      ),
    );
  }
}

class FullPageError extends StatelessWidget {
  const FullPageError(Object? _, StackTrace? __, {super.key});

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    final hasAppBar = Scaffold.of(context).hasAppBar;

    return Padding(
      padding: EdgeInsets.only(
        top: fullHeight / 3 + (hasAppBar ? 0 : kToolbarHeight),
      ),
      child: const Center(
        key: ValueKey('error'),
        child: Text('An error occurred'),
      ),
    );
  }
}

class FullPageMessage extends StatelessWidget {
  const FullPageMessage({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    final hasAppBar = Scaffold.of(context).hasAppBar;

    return Padding(
      padding: EdgeInsets.only(
        top: fullHeight / 3 + (hasAppBar ? 0 : kToolbarHeight),
      ),
      child: Center(
        key: const ValueKey('message'),
        child: Text(message),
      ),
    );
  }
}
