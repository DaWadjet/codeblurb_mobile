import 'package:codeblurb_mobile/data/auth/models/token.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

Token decode({required String token}) {
  final decodedToken = JwtDecoder.decode(token);
  return Token.fromJson(decodedToken);
}
