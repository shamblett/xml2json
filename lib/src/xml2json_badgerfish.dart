/*
 * Package : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 */

part of '../xml2json.dart';

/// Badgerfish transform class.
class _Xml2JsonBadgerfish {
  /// Badgerfish transformer function.

  final bool useLocalNameForNodes;
  final String _marker = '"\$"';
  final String _xmlnsPrefix = '"@xmlns"';
  final String _cdata = '"__cdata"';

  _Xml2JsonBadgerfish(this.useLocalNameForNodes);

  /// Transformer function
  String transform(XmlDocument? xmlNode) {
    Map<dynamic, dynamic> json;
    try {
      json = _transform(xmlNode);
    } on Exception catch (e, stack) {
      Error.throwWithStackTrace(
        Xml2JsonException(
          'Badgerfish internal transform error => ${e.toString()}',
        ),
        stack,
      );
    }
    return json.toString();
  }

  Map<dynamic, dynamic> _transform(XmlDocument? node) {
    final json = <dynamic, dynamic>{};

    void process(dynamic node, Map<dynamic, dynamic> obj, dynamic ns) {
      if (node is XmlText) {
        /* Text node processing */
        final sanitisedNodeData = _Xml2JsonUtils.escapeTextForJson(node.value);
        final nodeData = '"$sanitisedNodeData"';
        if (obj[_marker] is List) {
          obj[_marker].add(nodeData);
        } else if (obj[_marker] is Map<dynamic, dynamic>) {
          obj[_marker] = <dynamic>[obj[_marker], nodeData];
        } else {
          if ((obj).containsKey(_marker)) {
            obj[_marker] = obj[_marker] + nodeData;
          } else {
            obj[_marker] = nodeData;
          }
        }
      } else if (node is XmlElement) {
        /* Element node processing */
        final p = <dynamic, dynamic>{};
        final nodeName =
            useLocalNameForNodes ? '"${node.name.local}"' : '"${node.name}"';
        for (var i = 0; i < node.attributes.length; i++) {
          final dynamic attr = node.attributes[i];
          final dynamic name = attr.name.qualified;
          dynamic value = attr.value;
          value = _Xml2JsonUtils.escapeTextForJson(value);
          if (name == 'xmlns') {
            ns[_marker] = '"$value"';
          } else if (name.indexOf('xmlns:') == 0) {
            String? namePrefix = name.substring(name.indexOf(':') + 1);
            namePrefix = '"$namePrefix"';
            ns[namePrefix] = '"$value"';
          } else {
            final indexName = '"@$name"';
            p[indexName] = '"$value"';
          }
        }

        if (ns.isNotEmpty) {
          for (final String prefix in ns.keys) {
            if (!p.containsKey(_xmlnsPrefix)) {
              final pList = <Map<dynamic, dynamic>>[];
              p[_xmlnsPrefix] = pList;
            }
            final nameMap = <String, String?>{};
            nameMap[prefix] = ns[prefix];
            p[_xmlnsPrefix].add(nameMap);
          }
        }

        if (obj[nodeName] is List) {
          obj[nodeName].add(p);
        } else if (obj[nodeName] is Map<dynamic, dynamic>) {
          obj[nodeName] = <dynamic>[obj[nodeName], p];
        } else {
          obj[nodeName] = p;
        }
        for (var j = 0; j < node.children.length; j++) {
          process(node.children[j], p, <dynamic, dynamic>{});
        }
      } else if (node is XmlCDATA) {
        /* CDATA node processing */
        final sanitisedNodeData = _Xml2JsonUtils.escapeTextForJson(node.value);
        final nodeData = '"$sanitisedNodeData"';
        obj[_cdata] = nodeData;
      } else if (node is XmlDocument) {
        /* Document node processing */
        for (var k = 0; k < node.children.length; k++) {
          process(node.children[k], obj, <dynamic, dynamic>{});
        }
      }
    }

    process(node, json, <dynamic, dynamic>{});
    return json;
  }
}
