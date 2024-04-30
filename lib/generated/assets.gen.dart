/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/article.svg
  SvgGenImage get article => const SvgGenImage('assets/images/article.svg');

  /// File path: assets/images/badge-info.svg
  SvgGenImage get badgeInfo =>
      const SvgGenImage('assets/images/badge-info.svg');

  /// File path: assets/images/chevron-down.svg
  SvgGenImage get chevronDown =>
      const SvgGenImage('assets/images/chevron-down.svg');

  /// File path: assets/images/circle-check.svg
  SvgGenImage get circleCheck =>
      const SvgGenImage('assets/images/circle-check.svg');

  /// File path: assets/images/circle-x.svg
  SvgGenImage get circleX => const SvgGenImage('assets/images/circle-x.svg');

  /// File path: assets/images/code.svg
  SvgGenImage get code => const SvgGenImage('assets/images/code.svg');

  /// File path: assets/images/eye.svg
  SvgGenImage get eye => const SvgGenImage('assets/images/eye.svg');

  /// File path: assets/images/eyeoff.svg
  SvgGenImage get eyeoff => const SvgGenImage('assets/images/eyeoff.svg');

  /// File path: assets/images/home.svg
  SvgGenImage get home => const SvgGenImage('assets/images/home.svg');

  /// File path: assets/images/hourglass.svg
  SvgGenImage get hourglass => const SvgGenImage('assets/images/hourglass.svg');

  /// File path: assets/images/info.svg
  SvgGenImage get info => const SvgGenImage('assets/images/info.svg');

  /// File path: assets/images/loader.svg
  SvgGenImage get loader => const SvgGenImage('assets/images/loader.svg');

  /// File path: assets/images/my-courses.svg
  SvgGenImage get myCourses =>
      const SvgGenImage('assets/images/my-courses.svg');

  /// File path: assets/images/play.svg
  SvgGenImage get play => const SvgGenImage('assets/images/play.svg');

  /// File path: assets/images/quiz.svg
  SvgGenImage get quiz => const SvgGenImage('assets/images/quiz.svg');

  /// File path: assets/images/send.svg
  SvgGenImage get send => const SvgGenImage('assets/images/send.svg');

  /// File path: assets/images/shopping-cart.svg
  SvgGenImage get shoppingCart =>
      const SvgGenImage('assets/images/shopping-cart.svg');

  /// File path: assets/images/star.svg
  SvgGenImage get star => const SvgGenImage('assets/images/star.svg');

  /// File path: assets/images/star_filled.svg
  SvgGenImage get starFilled =>
      const SvgGenImage('assets/images/star_filled.svg');

  /// File path: assets/images/terminal.svg
  SvgGenImage get terminal => const SvgGenImage('assets/images/terminal.svg');

  /// File path: assets/images/updated-at.svg
  SvgGenImage get updatedAt =>
      const SvgGenImage('assets/images/updated-at.svg');

  /// File path: assets/images/user.svg
  SvgGenImage get user => const SvgGenImage('assets/images/user.svg');

  /// File path: assets/images/users.svg
  SvgGenImage get users => const SvgGenImage('assets/images/users.svg');

  /// File path: assets/images/video.svg
  SvgGenImage get video => const SvgGenImage('assets/images/video.svg');

  /// File path: assets/images/wand-sparkles.svg
  SvgGenImage get wandSparkles =>
      const SvgGenImage('assets/images/wand-sparkles.svg');

  /// File path: assets/images/x.svg
  SvgGenImage get x => const SvgGenImage('assets/images/x.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        article,
        badgeInfo,
        chevronDown,
        circleCheck,
        circleX,
        code,
        eye,
        eyeoff,
        home,
        hourglass,
        info,
        loader,
        myCourses,
        play,
        quiz,
        send,
        shoppingCart,
        star,
        starFilled,
        terminal,
        updatedAt,
        user,
        users,
        video,
        wandSparkles,
        x
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [en];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
