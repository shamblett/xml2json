/*
 * Packge : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 16/02/2018
 * Copyright :  S.Hamblett
 */

import 'package:xml2json/xml2json.dart';
import '../test/xml2json_test_strings.dart';

// ignore_for_file: omit_local_variable_types
// ignore_for_file: unnecessary_final
// ignore_for_file: cascade_invocations
// ignore_for_file: avoid_print

void main() {
  // Create a client transformer
  final Xml2Json myTransformer = Xml2Json();

  // Parse a simple XML string

  myTransformer.parse(goodXmlString);
  print('XML string');
  print(goodXmlString);
  print('');

  // Transform to JSON using Badgerfish
  String json = myTransformer.toBadgerfish();
  print('Badgerfish');
  print('');
  print(json);
  print('');

  // Transform to JSON using GData
  json = myTransformer.toGData();
  print('GData');
  print('');
  print(json);
  print('');

  // Transform to JSON using Parker
  json = myTransformer.toParker();
  print('Parker');
  print('');
  print(json);
}
