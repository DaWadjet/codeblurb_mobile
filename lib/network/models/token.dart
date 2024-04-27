import 'package:codeblurb_mobile/network/models/token_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable(createToJson: false)
class Token {
  Token(this.type, this.customerName, this.customerId, this.expirInMSE);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  @JsonKey(name: 'sub')
  final TokenType type;
  @JsonKey(name: 'aud')
  final String customerName;
  final int customerId;
  @JsonKey(name: 'exp')
  final int expirInMSE;
}
