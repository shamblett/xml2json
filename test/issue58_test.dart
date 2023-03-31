@TestOn('vm')

import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test('< causing parse error', () {
    final Xml2Json myTransformer = Xml2Json();
    myTransformer.parse("<a>aaaa<aaaaa</a>");
  });

  test('lt fixes parse error', () {
    final Xml2Json myTransformer = Xml2Json();
    myTransformer.parse("<a>aaaa&lt;aaaaa</a>");
  });
}
