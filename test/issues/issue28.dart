import 'dart:convert';
import 'package:pana/models.dart';
import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test(
      'Unhandled Exception: FormatException: Unrecognized string escape',
      () {
        const input = '''<?xml version="1.0" encoding="UTF-8"?>
            <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
        <soapenv:Body>
        <ns1:GetCommentsResponse xmlns:ns1="http://website.com/AppWS/">
        <status>true</status>
        <message>Succeed</message>
        <comments>
        <feedback>it's a bug, it's not a bug</feedback>
        </comments>
        </ns1:GetCommentsResponse >
        </soapenv:Body>
        </soapenv:Envelope>''';

        final xmlParser = Xml2Json();
        xmlParser.parse(input);
        var jsonResponse = xmlParser.toParker();
        print(jsonResponse);
  });
}
