/*
 * issue36
 *
 * @author: JuneCheng
 * @date: 2021/06/04 13:05:46
 * Copyright © 2021年 zjhcsoft. All rights reserved.
 */
@TestOn('vm')
library;

import 'dart:convert';
import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test('Transform xml without attributes,and specify a node as an array', () {
    const input = '''<?xml version="1.0" encoding="utf-8"?>
                      <root>
                        <result>ok</result>
                        <items>
                          <item>Flutter</item>
                        </items>
                      </root>
                      ''';

    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toParkerWithAttrs(array: ['item']);
    print(jsonResponse);
    expect(
      jsonResponse,
      '{"root": {"result": "ok", "items": {"item": ["Flutter"]}}}',
    );
    var decodedOk = true;
    try {
      json.decode(jsonResponse);
    } on FormatException {
      decodedOk = false;
    }
    expect(decodedOk, isTrue);
  });
}
