import 'package:jwt_decoder/jwt_decoder.dart';

class JwtDecoderManager {
  static JwtDecoderManager? _instance;
  static JwtDecoderManager get instance {
    _instance ??= JwtDecoderManager._init();
    return _instance!;
  }

  JwtDecoderManager._init();

  dynamic decode({
    required String token,
    required Function(Map<String, dynamic> json) fromJson,
  }) {
    final data = JwtDecoder.tryDecode(token);
    if (data == null) {
      throw Exception("Token is invalid");
    }
    return fromJson(data);
  }

  bool isExpired({required String token}) {
    return JwtDecoder.isExpired(token);
  }
}
