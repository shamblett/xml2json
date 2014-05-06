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

class _Xml2JsonGData {
  
  /**
   * GData transformer function.
   * 
   */
  Map _transform(var node) {
    
    var json = {};
    
    process(var node, var obj, var ns) {
      
      String marker = '"\$t"';
      String xmlnsPrefix = '"xmlns"';
      
      if (node is XmlText) {
        
        /* Text node processing */
        String sanitisedNodeData = _Xml2JsonUtils.escapeTextForJson(node.data);
        String nodeData = '"'+sanitisedNodeData+'"';
        if (obj["$marker"] is List) {
            obj["$marker"].add(nodeData);
        } else if (obj["$marker"] is Map) {
            obj["$marker"] = [obj["$marker"], nodeData];
        } else { 
          obj["$marker"] = nodeData;
        }
        
      } else if (node is XmlElement) {
        
        /* Element node processing */ 
        var p = {};
        String nodeName = "\"${node.name}\"";
        nodeName = nodeName.replaceAll(':', '\$');
        
        for (var i = 0; i < node.attributes.length; i++) {
                
          var attr = node.attributes[i];
          var name = attr.name.qualified;
          var value = attr.value;
          if (name == "xmlns") {
            ns["\"$name\""] = '"'+value+'"';
          } else if (name.indexOf("xmlns:") == 0) {
            String namePrefix = name.replaceAll(':', '\$');
            namePrefix = '"'+namePrefix+'"';
            ns[namePrefix] = '"'+value+'"';
          } else {
            String indexName = '"$name"';
            p[indexName] = '"'+value+'"';
          }
         }
        
         if ( ns.isNotEmpty ) {
          for (var prefix in ns.keys) {
            if ( !p.containsKey(xmlnsPrefix))  {
              List pList = new List<Map>();
              p[xmlnsPrefix] = pList;
            }
            p[prefix] = ns[prefix];
           }
         }
         
         if (obj[nodeName].runtimeType is List) {
           obj[nodeName].add(p);
         } else if (obj[nodeName].runtimeType is Map) {
          obj[nodeName] = [obj[nodeName], p];
         } else {
          obj[nodeName] = p;
         }
         
         for (var j = 0; j < node.children.length; j++) {
          process(node.children[j], p, {});
         }
         
      } else if (node is XmlDocument) {
        
          /* Document node processing */
          for (var k = 0; k < node.children.length; k++) {
            process(node.children[k], obj, {});
          }
      }  else if (node is XmlProcessing) {
        
          /* Processing node, only text in this node */
          String processingString = node.data;
          Map nodeMap = _Xml2JsonUtils.mapProcessingNode(processingString);
          for ( String i in nodeMap.keys ) {
            
            String index = '"'+i+'"';
            String sanitisedNodeData = _Xml2JsonUtils.escapeTextForJson(nodeMap[i]);
            String nodeData = '"'+sanitisedNodeData+'"';   
            obj[index] = nodeData;
            
          }
      }
      
    };
    
    process(node, json, {});
    return json;
    
  }
    
  
  /**
   * Transformer function
   */
  String transform(var xmlNode) {
    
    Map json = null;
    try {
      
      json = _transform(xmlNode);
      
    } catch(e) {
      
      throw new Xml2JsonException("GData internal transform error => ${e.toString()}");
    }
    
    return json.toString();
    
  }
  
}
  