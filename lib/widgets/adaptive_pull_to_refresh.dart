import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptivePullToRefresh extends StatelessWidget {
  const AdaptivePullToRefresh({
    required this.onRefresh,
    required this.child,
    super.key,
  });
  final Future<void> Function() onRefresh;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? IOSRefreshIndicator(
            onRefresh: onRefresh,
            child: child,
          )
        : AndroidRefreshIndicator(
            onRefresh: onRefresh,
            child: child,
          );
  }
}

class IOSRefreshIndicator extends StatelessWidget {
  const IOSRefreshIndicator({
    required this.onRefresh,
    required this.child,
    super.key,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return child;
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}

class AndroidRefreshIndicator extends StatelessWidget {
  const AndroidRefreshIndicator({
    required this.onRefresh,
    required this.child,
    super.key,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: child,
          ),
        ),
      ),
    );
  }
}
