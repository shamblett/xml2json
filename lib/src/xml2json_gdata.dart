/*
 * Package : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 * GData conversion class.
 * 
 * This is Badgerfish except that it drops the @ symbol for attributes 
 * and uses $t instead of just $ for values, also the XML Processing element is
 * added at the top of the JSON output.
 * 
 */

part of xml2json;

// ignore_for_file: omit_local_variable_types
// ignore_for_file: unnecessary_final
// ignore_for_file: cascade_invocations
// ignore_for_file: avoid_print
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: always_specify_types

/// GData transform class, see Transforming Details.md document in the
/// examples directory for further details.
class _Xml2JsonGData {
  final String _marker = '"\$t"';
  final String _xmlnsPrefix = '"xmlns"';
  final String _cdata = '"__cdata"';

  /// GData transformer function.

  Map<dynamic, dynamic> _transform(XmlDocument node) {
    final Map<dynamic, dynamic> json = <dynamic, dynamic>{};

    void _process(dynamic node, dynamic obj, dynamic ns) {
      if (node is XmlText) {
        /* Text node processing */
        final String sanitisedNodeData =
            _Xml2JsonUtils.escapeTextForJson(node.text);
        final String nodeData = '"$sanitisedNodeData"';
        if (obj['$_marker'] is List) {
          obj['$_marker'].add(nodeData);
        } else if (obj['$_marker'] is Map) {
          obj['$_marker'] = <dynamic>[obj['$_marker'], nodeData];
        } else {
          obj['$_marker'] = nodeData;
        }
      } else if (node is XmlElement) {
        /* Element node processing */
        final Map<dynamic, dynamic> p = <dynamic, dynamic>{};
        String nodeName = '"${node.name}"';
        nodeName = nodeName.replaceAll(':', '\$');

        for (int i = 0; i < node.attributes.length; i++) {
          final XmlAttribute attr = node.attributes[i];
          final String name = attr.name.qualified;
          final dynamic value = attr.value;
          if (name == 'xmlns') {
            ns['"$name"'] = '"$value"';
          } else if (name.indexOf('xmlns:') == 0) {
            String namePrefix = name.replaceAll(':', '\$');
            namePrefix = '"$namePrefix"';
            ns[namePrefix] = '"$value"';
          } else {
            final String indexName = '"$name"';
            p[indexName] = '"$value"';
          }
        }

        if (ns.isNotEmpty) {
          for (final String prefix in ns.keys) {
            if (!p.containsKey(_xmlnsPrefix)) {
              final List<dynamic> pList = [<dynamic, dynamic>{}];
              p[_xmlnsPrefix] = pList;
            }
            p[prefix] = ns[prefix];
          }
        }

        if (obj[nodeName] is List) {
          obj[nodeName].add(p);
        } else if (obj[nodeName] is Map) {
          obj[nodeName] = <dynamic>[obj[nodeName], p];
        } else {
          obj[nodeName] = p;
        }

        for (int j = 0; j < node.children.length; j++) {
          _process(node.children[j], p, <dynamic, dynamic>{});
        }
      } else if (node is XmlDocument) {
        /* Document node processing */
        for (int k = 0; k < node.children.length; k++) {
          _process(node.children[k], obj, <dynamic, dynamic>{});
        }
      } else if (node is XmlCDATA) {
        /* CDATA node processing */
        final String sanitisedNodeData =
            _Xml2JsonUtils.escapeTextForJson(node.text);
        final String nodeData = '"$sanitisedNodeData"';
        obj['$_cdata'] = nodeData;
      } else if (node is XmlProcessing) {
        /* Processing node, only text in this node */
        final String processingString = node.text;
        final Map<String, String> nodeMap =
            _Xml2JsonUtils.mapProcessingNode(processingString);
        for (final String i in nodeMap.keys) {
          final String index = '"$i"';
          final String sanitisedNodeData =
              _Xml2JsonUtils.escapeTextForJson(nodeMap[i]);
          final String nodeData = '"$sanitisedNodeData"';
          obj[index] = nodeData;
        }
      }
    }

    _process(node, json, <dynamic, dynamic>{});
    return json;
  }

  /// Transformer function
  String transform(XmlDocument xmlNode) {
    Map<dynamic, dynamic> json;
    try {
      json = _transform(xmlNode);
    } on Exception catch (e) {
      throw Xml2JsonException(
          'GData internal transform error => ${e.toString()}');
    }
    return json.toString();
  }
}
