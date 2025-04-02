/*
 * issue36
 *
 * @author: JuneCheng
 * @date: 2021/06/04 13:05:46
 * Copyright © 2021年 zjhcsoft. All rights reserved.
 */
// @dart=2.12.0
@TestOn('vm')
import 'dart:convert';
import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test('List as single element', () {
    var transformer = Xml2Json();
    transformer.parse('<root><a>1</a><a>2</a><a>3</a><a>4</a></root>');
    final output = transformer.toParkerWithAttrs();
    print(output);
    expect(output, '{"root": {"a": ["1", "2", "3", "4"]}}');
  });
}
