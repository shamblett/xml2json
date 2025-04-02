/*
 * Package : xml2json
 * Author : A. REGNARD <arthur.regnard@gmail.com>
 * Date   : 26/04/2023
 */

part of '../xml2json.dart';

/// OpenRally transform class
class _Xml2JsonOpenRally {
  /// Transformer function
  String transform(
    XmlDocument? xmlNode, {
    String attributePrefix = '',
  }) {
    Map<dynamic, dynamic> json;
    try {
      json = _recursiveParse(xmlNode, attributePrefix: attributePrefix);
    } on Exception catch (e, stack) {
      Error.throwWithStackTrace(
          Xml2JsonException(
              'OpenRally internal transform error => ${e.toString()}'),
          stack);
    }
    return json.toString();
  }

  String _toJsonString(dynamic value, {String? prefix}) {
    value = _Xml2JsonUtils.escapeTextForJson(value);
    return '"${prefix ?? ''}$value"';
  }

  ///
  dynamic _recursiveParse(
    dynamic node, {
    String attributePrefix = '',
  }) {
    if (node is XmlDocument) {
      Map<dynamic, dynamic> document = {};
      for (var child in node.children) {
        dynamic recursiveRet = _recursiveParse(child);
        if (recursiveRet is Map) {
          document.addAll(recursiveRet);
        }
      }
      return document;
    } else if (node is XmlElement) {
      var ret = {};
      String childrenString = '';
      Map<dynamic, dynamic> children = <dynamic, dynamic>{};

      for (var attribute in node.attributes) {
        children.addAll({
          _toJsonString(attribute.name.local, prefix: attributePrefix):
              _toJsonString(attribute.value)
        });
      }

      for (var child in node.children) {
        dynamic recursiveRet = _recursiveParse(child);
        if (recursiveRet is Map) {
          for (var elementKey in recursiveRet.keys) {
            if (children.keys.contains(elementKey)) {
              if (children[elementKey] is List) {
                children[elementKey].add(recursiveRet[elementKey]);
              } else if (children[elementKey] is Map<dynamic, dynamic>) {
                children[elementKey] = [
                  children[elementKey],
                  recursiveRet[elementKey],
                ];
              }
            } else {
              children.addAll(recursiveRet);
            }
          }
          ret.addAll({_toJsonString(node.name.local): children});
        } else if (recursiveRet is String) {
          childrenString = _toJsonString(recursiveRet);
        }
      }

      if (childrenString.isNotEmpty) {
        ret.addAll({_toJsonString(node.name.local): childrenString});
      } else if (children.isNotEmpty) {
        ret.addAll({_toJsonString(node.name.local): children});
      } else {
        ret.addAll({_toJsonString(node.name.local): null});
      }
      return ret;
    } else if (node is XmlText) {
      return node.toString();
    } else if (node is XmlCDATA) {
      return _Xml2JsonUtils.escapeTextForJson(node.value);
    } else {
      return true;
    }
  }
}
