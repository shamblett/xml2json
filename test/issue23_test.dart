@TestOn('vm')
library;

import 'dart:convert';
import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test(
    'xml2json escapes &quot; in the json output when used in an xml attribute - Badgerfish',
    () {
      final xml = '<element att=" &quot;test&quot; "/>';
      print(xml);
      final actual = (Xml2Json()..parse(xml)).toBadgerfish();
      print(actual);
      final expected = '{"element": {"@att": " \\"test\\" "}}';
      expect(actual, equals(expected));
      final decoded = json.decode(actual);
      expect(decoded['element']['@att'], ' "test" ');
    },
  );

  test(
    'xml2json escapes &quot; in the json output when used in an xml attribute - GData',
    () {
      final xml = '<element att=" &quot;test&quot; "/>';
      print(xml);
      final actual = (Xml2Json()..parse(xml)).toGData();
      print(actual);
      final expected = '{"element": {"att": " \\"test\\" "}}';
      expect(actual, equals(expected));
      final decoded = json.decode(actual);
      expect(decoded['element']['att'], ' "test" ');
    },
  );

  test(
    'xml2json escapes &quot; in the json output when used in an xml attribute - OpenRally',
    () {
      final xml = '<element att=" &quot;test&quot; "/>';
      print(xml);
      final actual = (Xml2Json()..parse(xml)).toOpenRally();
      print(actual);
      final expected = '{"element": {"att": " \\"test\\" "}}';
      expect(actual, equals(expected));
      final decoded = json.decode(actual);
      expect(decoded['element']['att'], ' "test" ');
    },
  );

  test(
    'xml2json escapes &quot; in the json output when used in an xml attribute - Parker',
    () {
      final xml = '<element att=" &quot;test&quot; "/>';
      print(xml);
      final actual = (Xml2Json()..parse(xml)).toParker();
      print(actual);
      final expected = '{"element": " \\"test\\" "}';
      expect(actual, equals(expected));
      final decoded = json.decode(actual);
      expect(decoded['element'], ' "test" ');
    },
    skip: true,
  );

  test(
    'xml2json escapes &quot; in the json output when used in an xml attribute - Parker with Attrs',
    () {
      final xml = '<element att=" &quot;test&quot; "/>';
      print(xml);
      final actual = (Xml2Json()..parse(xml)).toParkerWithAttrs();
      print(actual);
      final expected = '{"element": {"_att": " \\"test\\" ", "value": ""}}';
      expect(actual, equals(expected));
      final decoded = json.decode(actual);
      expect(decoded['element'], {'_att': ' "test" ', 'value': ''});
    },
  );
}
