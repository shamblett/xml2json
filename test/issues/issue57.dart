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
    print(res);
    final decoder = JsonDecoder();
    final decoded = decoder.convert(res);
    print(decoded);
    expect(decoded.toString(), r'{a: This is a\\n    multi-line\\n    string }');
  });
}
