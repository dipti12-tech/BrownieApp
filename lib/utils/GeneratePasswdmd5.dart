
import 'dart:convert';
import 'package:crypto/crypto.dart';

class GeneratePasswdmd5{

  String generateMd5hash(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}