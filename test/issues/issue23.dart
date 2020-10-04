import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test('xml2json escapes &quot; in the json output when used in an xml attribute', () {
    final xml = '<element att=" &quot;test&quot; "/>';

    final actual = (Xml2Json()..parse(xml)).toBadgerfish();
    final expected = '{"element": {"@att": " \\"test\\" "}}';

    expect(actual, equals(expected));
  });
}