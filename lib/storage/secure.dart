import 'dart:convert';

class EncryptData {
  // encode
  static encrypt(String text) {
    var bytes = utf8.encode(text);
    var base64Str = base64.encode(bytes);
    return base64Str;
  }

// decode
  static decrypt(String text) {
    var decodedBytes = base64.decode(text);
    var decodedStr = utf8.decode(decodedBytes);
    return decodedStr;
  }
}
