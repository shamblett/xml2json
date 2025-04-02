@TestOn('vm')
library;

import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test('Incorrect transform', () {
    const input =
        "<SubItems>"
        " <Item>"
        " <Value>1</Value>"
        " <LinkTo>1000029214</LinkTo>"
        " <Value>2</Value>"
        " <LinkTo>1000029214</LinkTo>"
        " <Value></Value>"
        " <LinkTo>1000029214</LinkTo>"
        " <Value>3</Value>"
        " <LinkTo>1000029214</LinkTo>"
        " </Item>"
        "</SubItems>";

    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toParkerWithAttrs();
    print(jsonResponse);
    expect(
      jsonResponse,
      '{"SubItems": {"Item": {"Value": ["1", "2", "", "3"], "LinkTo": ["1000029214", "1000029214", "1000029214", "1000029214"]}}}',
    );
  });
}
