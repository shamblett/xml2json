/*
 * Packge : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 16/02/2018
 * Copyright :  S.Hamblett
 */

import 'package:xml2json/xml2json.dart';
import '../test/xml2json_test_strings.dart';

void main() {
  // Create a client transformer
  final myTransformer = Xml2Json();

  // Parse a simple XML string

  myTransformer.parse(goodXmlString);
  print('XML string');
  print(goodXmlString);
  print('');

  // Transform to JSON using Badgerfish
  var json = myTransformer.toBadgerfish();
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

  // Transform to JSON using ParkerWithAttrs
  json = myTransformer.toParkerWithAttrs();
  print('ParkerWithAttrs');
  print('');
  print(json);

  // Transform to JSON using ParkerWithAttrs
  // A node in XML should be an array, but if there is only one element in the array, it will only be parsed into an object, so we need to specify the node as an array
  // xml中某一个节点本应该是一个数组，但是如果数组中只有一个元素，就只会被解析成一个对象，所以需要把该节点指定成数组
  json = myTransformer.toParkerWithAttrs(array: ['contact']);
  print('ParkerWithAttrs, specify the node as an array');
  print('');
  print(json);
}
