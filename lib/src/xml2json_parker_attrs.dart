/*
 * xml2json_parker_attrs
 * @description: 解析节点中的属性
 * 
 * @author: JuneCheng
 * @date: 2021/05/23 18:04:54
 */

part of xml2json;

/// ParkerWithAttrs transform class
class _Xml2JsonParkerWithAttrs {
  /// Parker transformer function.
  Map<dynamic, dynamic>? _transform(dynamic node, dynamic objin, {List<String>? array}) {
    Map<dynamic, dynamic>? obj = objin;
    if (node is XmlElement) {
      final nodeName = '"${node.name.qualified}"';
      // print('nodeName----------->$nodeName');
      if (obj![nodeName] is List && !obj.keys.contains(nodeName)) {
        obj[nodeName].add(<dynamic, dynamic>{});
        obj = obj[nodeName].last;
      } else if (obj[nodeName] is Map && !obj.keys.contains(nodeName)) {
        obj[nodeName] = <dynamic>[obj[nodeName], <dynamic, dynamic>{}];
        obj = obj[nodeName].last;
      } else {
        if (node.children.isNotEmpty) {
          if (node.children[0] is XmlText || node.children[0] is XmlCDATA) {
            _parseXmlTextNode(node, obj, nodeName, array: array);
          } else if (obj[nodeName] is Map) {
            var jsonCopy = json.decode(json.encode(obj[nodeName]));
            obj[nodeName] = <dynamic>[jsonCopy, <dynamic, dynamic>{}];
            obj = obj[nodeName].last;
            if (node.attributes.isNotEmpty) {
              _parseAttrs(node, obj);
            }
          } else if (obj[nodeName] is List) {
            obj[nodeName].add(<dynamic, dynamic>{});
            obj = obj[nodeName].last;
            if (node.attributes.isNotEmpty) {
              _parseAttrs(node, obj);
            }
          } else if ((array ?? []).contains(node.name.qualified)) {
            obj[nodeName] = <dynamic>[<dynamic, dynamic>{}];
            obj = obj[nodeName].last;
            if (node.attributes.isNotEmpty) {
              _parseAttrs(node, obj);
            }
          } else {
            obj[nodeName] = <dynamic, dynamic>{};
            obj = obj[nodeName];
            if (node.attributes.isNotEmpty) {
              _parseAttrs(node, obj);
            }
          }
        } else {
          /* No children, empty element */
          obj[nodeName] = null;
        }
      }

      for (var j = 0; j < node.children.length; j++) {
        _transform(node.children[j], obj, array: array);
      }
    } else if (node is XmlDocument) {
      for (var j = 0; j < node.children.length; j++) {
        _transform(node.children[j], obj, array: array);
      }
    }

    return obj;
  }

  /// 解析节点里的属性值
  void _parseAttrs(dynamic node, dynamic obj) {
    node.attributes.forEach((attr) {
      obj!['"_${attr.name.qualified}"'] = '"${attr.value}"';
    });
  }

  /// 解析XmlText节点
  void _parseXmlTextNode(dynamic node, dynamic obj, dynamic nodeName, {List<String>? array}) {
    final sanitisedNodeData = _Xml2JsonUtils.escapeTextForJson(node.children[0].text);
    var nodeData = '"$sanitisedNodeData"';
    // print('nodeData----------->$nodeData');
    if (nodeData.isEmpty) {
      nodeData = '';
    }
    var attrs = node.attributes;
    // 如果开始节点里有属性
    if (attrs.isNotEmpty) {
      var objTemp = <dynamic, dynamic>{};
      _parseAttrs(node, objTemp);
      objTemp['"value"'] = nodeData;
      if (obj[nodeName] is Map) {
        var jsonCopy = json.decode(json.encode(obj[nodeName]));
        obj[nodeName] = <dynamic>[jsonCopy, objTemp];
      } else if (obj[nodeName] is List) {
        obj[nodeName].add(objTemp);
      } else {
        obj[nodeName] = objTemp;
      }
    } else {
      if (obj[nodeName] is String) {
        obj[nodeName] = <dynamic>[obj[nodeName], nodeData];
      } else if (obj[nodeName] is List) {
        obj[nodeName].add(nodeData);
      } else {
        obj[nodeName] = nodeData;
      }
    }
    if ((array ?? []).contains(node.name.qualified)) {
      var jsonCopy = json.decode(json.encode(obj[nodeName]));
      obj[nodeName] = <dynamic>[jsonCopy];
    }
  }

  /// Transformer function
  String transform(XmlDocument? xmlNode, {List<String>? array}) {
    Map<dynamic, dynamic>? json;
    try {
      json = _transform(xmlNode, <dynamic, dynamic>{}, array: array);
    } on Exception catch (e) {
      throw Xml2JsonException('Parker internal transform error => ${e.toString()}');
    }

    return json.toString();
  }
}
