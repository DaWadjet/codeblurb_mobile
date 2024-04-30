import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_props.freezed.dart';

@freezed
class PageProps with _$PageProps {
  const factory PageProps({
    required String label,
    @Default(10) int size,
    Sort? sort,
    List<String>? skills,
    @Default('') String title,
    @Default(0) int page,
  }) = _PageProps;

  const PageProps._();

  Map<String, dynamic> toQueryParameters() {
    final queryParams = <String, dynamic>{
      'title': title,
    };
    queryParams['page'] = page.toString();
    queryParams['pageSize'] = size.toString();

    if (sort != null) {
      queryParams['sort'] =
          '${sort!.property},${sort!.ascending ? "asc" : "desc"}';
    }

    if (skills != null && skills!.isNotEmpty) {
      queryParams['skills'] = skills!.join(',');
    }

    return queryParams;
  }
}

@freezed
class Sort with _$Sort {
  factory Sort({required String property, required bool ascending}) = _Sort;
}
