/*
 * Package : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 */

part of xml2json;

/// Parker transform class
class _Xml2JsonParker {
  /// Parker transformer function.
  Map<dynamic, dynamic>? _transform(dynamic node, dynamic objin) {
    Map<dynamic, dynamic>? obj = objin;
    if (node is XmlElement) {
      final nodeName = '"${node.name.qualified}"';
      if (obj![nodeName] is List) {
        obj[nodeName].add(<dynamic, dynamic>{});
        obj = obj[nodeName].last;
      } else if (obj[nodeName] is Map) {
        obj[nodeName] = <dynamic>[obj[nodeName], <dynamic, dynamic>{}];
        obj = obj[nodeName].last;
      } else {
        if (node.children.isNotEmpty) {
          if (node.children[0] is XmlText || node.children[0] is XmlCDATA) {
            _parseXmlTextNode(node, obj, nodeName);
          } else if (obj[nodeName] is Map) {
            var jsonCopy = json.decode(json.encode(obj[nodeName]));
            obj[nodeName] = <dynamic>[jsonCopy, <dynamic, dynamic>{}];
            obj = obj[nodeName].last;
          } else if (obj[nodeName] is List) {
            obj[nodeName].add(<dynamic, dynamic>{});
            obj = obj[nodeName].last;
          } else {
            obj[nodeName] = <dynamic, dynamic>{};
            obj = obj[nodeName];
          }
        } else {
          /* No children, empty element */
          obj[nodeName] = null;
        }
      }

      for (var j = 0; j < node.children.length; j++) {
        _transform(node.children[j], obj);
      }
    } else if (node is XmlDocument) {
      for (var j = 0; j < node.children.length; j++) {
        _transform(node.children[j], obj);
      }
    }

    return obj;
  }

  /// 解析XmlText节点
  void _parseXmlTextNode(dynamic node, dynamic obj, dynamic nodeName) {
    final sanitisedNodeData = _Xml2JsonUtils.escapeTextForJson(node.children[0].text);
    var nodeData = '"$sanitisedNodeData"';
    if (nodeData.isEmpty) {
      nodeData = '';
    }
    if (obj[nodeName] is String) {
      obj[nodeName] = <dynamic>[obj[nodeName], nodeData];
    } else if (obj[nodeName] is List) {
      obj[nodeName].add(nodeData);
    } else {
      obj[nodeName] = nodeData;
    }
  }

  /// Transformer function
  String transform(XmlDocument? xmlNode) {
    Map<dynamic, dynamic>? json;
    try {
      json = _transform(xmlNode, <dynamic, dynamic>{});
    } on Exception catch (e) {
      throw Xml2JsonException('Parker internal transform error => ${e.toString()}');
    }

    return json.toString();
  }
}
