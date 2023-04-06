@TestOn('vm')

import 'dart:convert';
import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test('Multiline strings', () {
    final s1 = r'''<a>This is a
    multi-line
    string </a>''';
    final Xml2Json myTransformer = Xml2Json();
    myTransformer.parse(s1);
    print(s1);
    final res = myTransformer.toParker();
    print('Undecoded : $res');
    final decoder = JsonDecoder();
    final decoded = decoder.convert(res);
    print('Decoded : $decoded');
    expect(decoded.toString(), r'{a: This is a\\n    multi-line\\n    string }');
    final encoder = JsonEncoder();
    final encoded = encoder.convert(decoded);
    print('Encoded : $encoded');
  });
}
