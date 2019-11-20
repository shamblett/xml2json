/*
 * Package : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 * Parker conversion class.
 * 
 * The Parker convention is lossy, it simply ignores XML attributes. 
 * The advantage is that it generates much leaner and cleaner JSON closer
 * to javascript Json than Badgerfish or GData which attempt to preserve
 * the XML structure.
 * 
 * Good for arrays of books, people etc that just happen to be in XML format
 * but are basically simple collections.
 * 
 * This transform conforms to the Parker convention here 
 * https://code.google.com/p/xml2json-xslt/wiki/TransformingRules except
 * for item 7, the name elements are still grouped as an array but under a 
 * property named after the elements, so 
 * 
 * <root><item>1</item><item>2</item><item>three</item></root>
 * 
 * becomes :-
 * 
 * {"item":["1","2","three"]} NOT ["1","2","three"]
 * 
 * This allows all 'items' to be pulled out of the data in one go and is felt to be
 * more useful than the conventional Parker transform.
 * 
 */

part of xml2json;

class _Xml2JsonParker {
  /// Parker transformer function.
  Map<dynamic, dynamic> _transform(dynamic node, dynamic objin) {
    Map<dynamic, dynamic> obj = objin;
    if (node is XmlElement) {
      final String nodeName = '"${node.name.qualified}"';
      if (obj[nodeName] is List) {
        obj[nodeName].add(Map<dynamic, dynamic>());
        obj = obj[nodeName].last;
      } else if (obj[nodeName] is Map) {
        obj[nodeName] = <dynamic>[obj[nodeName], Map<dynamic, dynamic>()];
        obj = obj[nodeName].last;
      } else {
        if (node.children.isNotEmpty) {
          if (node.children[0] is XmlText) {
            final String sanitisedNodeData =
                _Xml2JsonUtils.escapeTextForJson(node.children[0].text);
            String nodeData = '"$sanitisedNodeData"';
            if (nodeData.isEmpty) {
              nodeData = null;
            }
            obj[nodeName] = nodeData;
          } else if(node.children[0] is XmlCDATA){
            final String sanitisedNodeData =
                _Xml2JsonUtils.escapeTextForJson(node.children[0].text);
            String nodeData = '"$sanitisedNodeData"';
            if (nodeData.isEmpty) {
              nodeData = null;
            }
            obj[nodeName] = nodeData;
          }else {
            obj[nodeName] = Map<dynamic, dynamic>();
            obj = obj[nodeName];
          }
        } else {
          /* No children, empty element */
          obj[nodeName] = null;
        }
      }

      for (int j = 0; j < node.children.length; j++) {
        _transform(node.children[j], obj);
      }
    } else if (node is XmlDocument) {
      for (int j = 0; j < node.children.length; j++) {
        _transform(node.children[j], obj);
      }
    }

    return obj;
  }

  /// Transformer function
  String transform(XmlDocument xmlNode) {
    Map<dynamic, dynamic> json;
    try {
      json = _transform(xmlNode, Map<dynamic, dynamic>());
    } on Exception catch (e) {
      throw Xml2JsonException(
          'Parker internal transform error => ${e.toString()}');
    }

    return json.toString();
  }
}
