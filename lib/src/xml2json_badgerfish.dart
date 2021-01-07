/*
 * Package : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 */

part of xml2json;

/// Badgerfish transform class, see Transforming Details.md document in the
/// examples directory for further details.
class _Xml2JsonBadgerfish {
  /// Badgerfish transformer function.

  final String _marker = '"\$"';
  final String _xmlnsPrefix = '"@xmlns"';
  final String _cdata = '"__cdata"';

  Map<dynamic, dynamic> _transform(XmlDocument? node) {
    final json = <dynamic, dynamic>{};

    void _process(dynamic node, Map<dynamic, dynamic> obj, dynamic ns) {
      if (node is XmlText) {
        /* Text node processing */
        final sanitisedNodeData = _Xml2JsonUtils.escapeTextForJson(node.text);
        final nodeData = '"$sanitisedNodeData"';
        if (obj['$_marker'] is List) {
          obj['$_marker'].add(nodeData);
        } else if (obj['$_marker'] is Map<dynamic, dynamic>) {
          obj['$_marker'] = <dynamic>[obj['$_marker'], nodeData];
        } else {
          obj['$_marker'] = nodeData;
        }
      } else if (node is XmlElement) {
        /* Element node processing */
        final p = <dynamic, dynamic>{};
        final nodeName = '"${node.name}"';
        for (var i = 0; i < node.attributes.length; i++) {
          final dynamic attr = node.attributes[i];
          final dynamic name = attr.name.qualified;
          dynamic value = attr.value;
          // If the value is double quoted fix it.
          if (value.startsWith('"') && value.endsWith('"')) {
            value = value.substring(1, value.length - 1);
          }
          // Fix @quot markup
          if (value.contains(r'"')) {
            value = _Xml2JsonUtils.escapeTextForJson(value);
          }
          if (name == 'xmlns') {
            ns['$_marker'] = '"$value"';
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
          _process(node.children[j], p, <dynamic, dynamic>{});
        }
      } else if (node is XmlCDATA) {
        /* CDATA node processing */
        final sanitisedNodeData = _Xml2JsonUtils.escapeTextForJson(node.text);
        final nodeData = '"$sanitisedNodeData"';
        obj['$_cdata'] = nodeData;
      } else if (node is XmlDocument) {
        /* Document node processing */
        for (var k = 0; k < node.children.length; k++) {
          _process(node.children[k], obj, <dynamic, dynamic>{});
        }
      }
    }

    _process(node, json, <dynamic, dynamic>{});
    return json;
  }

  /// Transformer function
  String transform(XmlDocument? xmlNode) {
    Map<dynamic, dynamic> json;
    try {
      json = _transform(xmlNode);
    } on Exception catch (e) {
      throw Xml2JsonException(
          'Badgerfish internal transform error => ${e.toString()}');
    }
    return json.toString();
  }
}
