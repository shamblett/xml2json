/*
 * Packge : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 * Badgerfish conversion class.
 * 
 * The Badgerfish convention is a fairly comprehensive JSON representation of XML in 
 * the sense that it accommodates element attributes and namespaces. Unfortunately, 
 * this also adds a bit of overhead to the JSON syntax.
 * 
 * Transforms as follows :-
 * 
 * Element names become object properties
 * Text content of elements goes in the $ property of an object.
 * Nested elements become nested properties
 * Multiple elements at the same level become named array elements.
 * Attributes go in properties whose names begin with @.
 * Multiple attributes at the same level become array elements.
 * Active namespaces for an element go in the element's @xmlns property.
 * The default namespace URI goes in @xmlns.$.
 * Other namespaces go in other properties of @xmlns.
 * Elements with namespace prefixes become object properties, too.
 * The @xmlns property goes only in the object relative to the element where namespace was declared.
 * 
 */

part of xml2json;

class _Xml2JsonBadgerfish {
  
  
  /**
   * Badgerfish transformer function.
   * 
   * This is ported from an original javascript implementation here :-
   * http://ruchirawageesha.blogspot.co.uk/2011/01/xml-to-badgerfish-converter-in.html
   * 
   * Its been 'Dartified' only enough to make it functional which means its a bit ugly
   * and a bit fragile, I don't for instance like the 'runtimeType == "LinkedHashMap" 
   * constructs, however, its tested and works OK.
   */
  Map _transform(var node) {
    
    var json = {};
    
    process(var node, var obj, var ns) {
      
      String marker = '"\$"';
      String xmlnsPrefix = '"@xmlns"';
      
      if (node.runtimeType.toString() == "XmlText") {
        
        /* Text node processing */
        String sanitisedNodeData = _Xml2JsonUtils.escapeTextForJson(node.data);
        String nodeData = '"'+sanitisedNodeData+'"';
        if (obj["$marker"].runtimeType.toString() == "List") {
          obj["$marker"].add(nodeData);
        } else if (obj["$marker"].runtimeType.toString() == "LinkedHashMap") {
          obj["$marker"] = [obj["$marker"], nodeData];
        } else {
          obj["$marker"] = nodeData;
        }
      
      } else if (node.runtimeType.toString() == "XmlElement") {
        
        /* Element node processing */ 
        var p = {};
        var nodeName = "\"${node.name}\"";
        for (var i = 0; i < node.attributes.length; i++) {
                
          var attr = node.attributes[i];
          var name = attr.name.qualified;
          var value = attr.value;
          if (name == "xmlns") {
            ns["$marker"] = '"'+value+'"';
          } else if (name.indexOf("xmlns:") == 0) {
            String namePrefix = name.substring(name.indexOf(":") + 1);
            namePrefix = '"'+namePrefix+'"';
            ns[namePrefix] = '"'+value+'"';
          } else {
            String indexName = '"@$name"';
            p[indexName] = '"'+value+'"';
          }
         }
        
         if ( ns.isNotEmpty ) {
          for (var prefix in ns.keys) {
            if ( !p.containsKey(xmlnsPrefix))  {
              List pList = new List<Map>();
              p[xmlnsPrefix] = pList;
            }
            Map nameMap = new Map<String,String>();
            nameMap[prefix] = ns[prefix];
            p[xmlnsPrefix].add(nameMap);
           }
         }
         
         if (obj[nodeName].runtimeType.toString() == "List") {
          obj[nodeName].add(p);
         } else if (obj[nodeName].runtimeType.toString() == "LinkedHashMap" ) {
          obj[nodeName] = [obj[nodeName], p];
         } else {
          obj[nodeName] = p;
         }
         for (var j = 0; j < node.children.length; j++) {
          process(node.children[j], p, {});
         }
         
      } else if (node.runtimeType.toString() == "XmlDocument") {
        
          /* Document node processing */
          for (var k = 0; k < node.children.length; k++) {
            process(node.children[k], obj, {});
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
      
      throw new Xml2JsonException("Badgerfish internal transform error => ${e.toString()}");
    }
    
    return json.toString();
    
  }
  
  
}