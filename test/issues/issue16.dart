/*
 * Packge : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 */
// @dart=2.10.5
TestOn('vm');

import 'package:xml2json/xml2json.dart';
import 'package:test/test.dart';
import '../xml2json_test_strings.dart';

void main() {
  /* Initialise */
  final myTransformer = Xml2Json();

  test('Issue 16', () {
    myTransformer.parse(issue16);
    final bf = myTransformer.toBadgerfish();
    expect(bf, isNotNull);
    expect(bf.contains('""C:Program Files (x86)MSBuild14.0BinMSBuild.exe""'),
        isFalse);
    final gd = myTransformer.toGData();
    expect(gd, isNotNull);
    expect(gd.contains('""C:Program Files (x86)MSBuild14.0BinMSBuild.exe""'),
        isFalse);
  });
}
