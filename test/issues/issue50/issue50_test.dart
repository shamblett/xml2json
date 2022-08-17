@TestOn('vm')

import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:io';

void main() {
  test('Book transform', () {

    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toParkerWithAttrs();
    print(jsonResponse);
  });
}
