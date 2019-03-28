/*
 * Packge : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 */

import 'package:xml2json/xml2json.dart';
import 'package:test/test.dart';
import '../xml2json_test_strings.dart';

void main() {
  /* Initialise */
  final Xml2Json myTransformer = Xml2Json();

  test('Issue 16', () {
    myTransformer.parse(issue16);
    final String bf = myTransformer.toBadgerfish();
    expect(bf, isNotNull);
    print(bf);
    final String gd = myTransformer.toGData();
    expect(gd, isNotNull);
    final String pa = myTransformer.toParker();
    expect(pa, isNotNull);
  });
}
