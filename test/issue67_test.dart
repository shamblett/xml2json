@TestOn('vm')
library;

import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  const input = "<root><item></item><name>john</name></root>";

  test('OpenRally', () {
    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toOpenRally();
    expect(jsonResponse, '{"root": {"item": null, "name": "john"}}');
  });

  test('Parker', () {
    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toParker();
    print(jsonResponse);
    expect(jsonResponse, '{"root": {"item": null, "name": "john"}}');
  });
}
