import 'package:json_annotation/json_annotation.dart';

enum CodingContentType {
  @JsonValue('SCRATCH')
  scratch,
  @JsonValue('DRAG_AND_DROP')
  dragAndDrop,
  @JsonValue('FILL_THE_GAP')
  fillInTheGaps,
}
