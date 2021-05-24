// @dart=2.12.0
@TestOn('vm')

import 'dart:convert';
import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test('Transform xml with attributes', () {
    const input = '''<?xml version="1.0" encoding="utf-8"?>
                      <root>
                        <result>ok</result>
                        <items parent="111">
                          <item id="10">Android</item>
                          <item id="11">iOS</item>
                          <item id="12">Flutter</item>
                        </items>
                      </root>
                      ''';

    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    // 如果多个相同的节点中只有String类型的value，将所有的value解析到同一个数组中
    var jsonResponse = xmlParser.toParkerWithAttrs();
    print(jsonResponse);
    expect(jsonResponse,
        '{"root": {"result": "ok", "items": {"_parent": "111", "item": [{"_id": "10", "value": "Android"}, {"_id": "11", "value": "iOS"}, {"_id": "12", "value": "Flutter"}]}}}');
    var decodedOk = true;
    try {
      final decoded = json.decode(jsonResponse);
    } on FormatException {
      decodedOk = false;
    }
    expect(decodedOk, isTrue);
  });

  test('Transform xml without attributes', () {
    const input = '''<?xml version="1.0" encoding="utf-8"?>
                      <root>
                        <result>ok</result>
                        <items>
                          <item>Android</item>
                          <item>iOS</item>
                          <item>Flutter</item>
                        </items>
                      </root>
                      ''';

    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toParkerWithAttrs();
    print(jsonResponse);
    expect(jsonResponse, '{"root": {"result": "ok", "items": {"item": ["Android", "iOS", "Flutter"]}}}');
    var decodedOk = true;
    try {
      final decoded = json.decode(jsonResponse);
    } on FormatException {
      decodedOk = false;
    }
    expect(decodedOk, isTrue);
  });
}
