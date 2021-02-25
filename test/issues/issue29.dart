import 'dart:convert';
import 'package:pana/models.dart';
import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test('Unhandled Exception: FormatException: Unrecognized string escape', () {
    const input = '''<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
   <soapenv:Body>
      <ns1:GetCommentsResponse xmlns:ns1="http://website.com/AppWS/">
         <status>true</status>
         <message>Succeed</message>
         <comments>
            <feedback>04/04/2019\$\$##+|=\\€</feedback>
         </comments>
      </ns1:GetCommentsResponse >
   </soapenv:Body>
</soapenv:Envelope>''';

    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toParker();
    expect(jsonResponse, '{"soapenv:Envelope": {"soapenv:Body": {"ns1:GetCommentsResponse": {"status": "true", "message": "Succeed", "comments": {"feedback": "04/04/2019\$\$##+|=\\€"}}}}}');
  });

  test('Parker convert', () {
    const input = '''<?xml version="1.0" encoding="UTF-8"?>
            <feedback>04/04/2019\$\$##+|=\\€</feedback>''';

    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toParker();
    expect(jsonResponse,'{"feedback": "04/04/2019\$\$##+|=\\€"}');
  });

  test('File path Windows', () {
    const input = '''<?xml version="1.0" encoding="UTF-8"?>
            <path>C:work\\fred\\joe</path>''';

    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toParker();
    expect(jsonResponse,'{"path": "C:work\\fred\\joe"}');
  });
  test('File path Linux', () {
    const input = '''<?xml version="1.0" encoding="UTF-8"?>
            <path>C:work/fred/joe</path>''';

    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toParker();
    expect(jsonResponse,'{"path": "C:work/fred/joe"}');
  });

  test('Should be escaped', () {
    var xml = '<post tag="\\m/"/>';
    final xml2json = Xml2Json()..parse(xml);
    final data = xml2json.toGData();
    final expected = '{"post": {"tag": "\\m/"}}';
    expect(data, equals(expected));
  });

}
