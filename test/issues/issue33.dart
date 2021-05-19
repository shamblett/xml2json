/*
 * Packge : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 */
// @dart=2.10.5
@TestOn('vm')

import 'package:xml2json/xml2json.dart';
import 'package:test/test.dart';
import '../xml2json_test_strings.dart';

void main() {
  /* Initialise */
  final myTransformer = Xml2Json();

  test('Issue 33', () {
    myTransformer.parse(issue33);
    final bf = myTransformer.toParker();
    expect(bf, '{"item": ["1","2","three"]}');
  });
}
