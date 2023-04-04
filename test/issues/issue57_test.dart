@TestOn('vm')

import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test('Multiline strings', () {
    final s1 = '''<a> This is a multi-line string </a>''';
    final Xml2Json myTransformer = Xml2Json();
    myTransformer.parse(s1);
    expect(myTransformer.toParker(), '{"a": " This is a multi-line string "}');
  });
}
