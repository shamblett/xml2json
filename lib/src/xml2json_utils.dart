/*
 * Package : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 * General utility class
 * 
 */

part of xml2json;

/// General utilities
class _Xml2JsonUtils {
  /// Escape any control characters and quotes for JSON encoding
  static String escapeTextForJson(String text) {
    var text1 = text.replaceAll('\n', '\\\\n');
    text1 = text1.replaceAll(r'\', r'\\');
    text1 = text1.replaceAll(r'"', r'\"');
    text1 = text1.replaceAll('\r', '\\\\r');
    text1 = text1.replaceAll('\t', '\\\\t');
    text1 = text1.replaceAll('\b', '\\\\f');

    return text1;
  }

  /// Turn the processing node into a map of values.
  static Map<String, String> mapProcessingNode(String text) {
    final nodeMap = <String, String>{};
    var text1 = text.trim();
    text1 = text1.replaceAll('"', '');
    final properties = text1.split(' ');
    for (final dynamic element in properties) {
      final List<String> elementList = element.split('=');
      if (elementList.length == 2) {
        nodeMap[elementList[0]] = elementList[1];
      }
    }

    return nodeMap;
  }

  /// Prepare the input XML string, close up tags, strip newlines
  /// between tags etc.
  static String prepareXmlString(String xmlString) {
    var xmlString1 = xmlString.trim();
    xmlString1 = xmlString1.replaceAll('>\n', '>');
    final regex = RegExp(r'>\s*<');
    return xmlString1 = xmlString1.replaceAll(regex, '><');
  }
}
