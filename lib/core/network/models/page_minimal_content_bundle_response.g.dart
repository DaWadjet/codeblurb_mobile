// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_minimal_content_bundle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedMinimalContentBundleResponse _$PagedMinimalContentBundleResponseFromJson(
        Map<String, dynamic> json) =>
    PagedMinimalContentBundleResponse(
      json['number'] as int,
      json['last'] as bool,
      json['first'] as bool,
      json['totalPages'] as int,
      json['size'] as int,
      json['numberOfElements'] as int,
      (json['content'] as List<dynamic>)
          .map((e) =>
              MinimalContentBundleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
