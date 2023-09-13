// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_content_bundles_separated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyContentBundlesSeparatedResponse _$MyContentBundlesSeparatedResponseFromJson(
        Map<String, dynamic> json) =>
    MyContentBundlesSeparatedResponse(
      (json['contentBundles'] as List<dynamic>)
          .map((e) => SeparatedContentBundleResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
