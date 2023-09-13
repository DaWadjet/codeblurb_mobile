// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimal_content_bundle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinimalContentBundleResponse _$MinimalContentBundleResponseFromJson(
        Map<String, dynamic> json) =>
    MinimalContentBundleResponse(
      (json['includedContent'] as List<dynamic>)
          .map(
              (e) => MinimalContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
