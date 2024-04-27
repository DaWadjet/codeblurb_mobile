// ignore_for_file: avoid_positional_boolean_parameters

import 'package:codeblurb_mobile/network/models/minimal_content_bundle_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_minimal_content_bundle_response.g.dart';

@JsonSerializable(createToJson: false)
class PagedMinimalContentBundleResponse {
  PagedMinimalContentBundleResponse(
    this.number,
    this.last,
    this.first,
    this.totalPages,
    this.size,
    this.numberOfElements,
    this.content,
  );

  factory PagedMinimalContentBundleResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PagedMinimalContentBundleResponseFromJson(json);

  final int number;
  final bool last;
  final bool first;
  final int totalPages;
  final int size;
  final int numberOfElements;
  final List<MinimalContentBundleResponse> content;
}
