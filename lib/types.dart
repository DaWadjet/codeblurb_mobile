import 'package:codeblurb_mobile/network/models/coding_content_type.dart';
import 'package:codeblurb_mobile/network/models/content_type.dart';
import 'package:codeblurb_mobile/network/models/seen_status.dart';
import 'package:dio/dio.dart';

typedef ApiResponse = Future<Response<Map<String, dynamic>>>;

class Section {
  Section({
    required this.name,
    required this.shortDescription,
    required this.estimatedTime,
    required this.contentType,
    required this.status,
    this.order = 0,
    this.codingContentType,
  });
  final String name;
  final String shortDescription;
  final int estimatedTime;
  final ContentType contentType;
  final SeenStatus status;
  final CodingContentType? codingContentType;
  final int order;
}
