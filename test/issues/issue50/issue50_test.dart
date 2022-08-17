@TestOn('vm')

import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

void main() {
  test('Book transform', () {
    var filePath =
        p.join(Directory.current.path, 'test', 'issues', 'issue50', 'book.xml');
    File file = File(filePath);
    final fileContent = file.readAsStringSync();
    final xmlParser = Xml2Json();
    xmlParser.parse(fileContent);
    var jsonResponse = xmlParser.toParkerWithAttrs();
    print(jsonResponse);
    filePath =
    p.join(Directory.current.path, 'test', 'issues', 'issue50', 'transformed.json');
    File outputFile = File(filePath);
    outputFile.writeAsStringSync(jsonResponse);
  });
}
