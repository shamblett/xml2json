/*
 * Packge : Xml2Json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 * Badgerfish conversion class.
 * 
 * Transforms as follows :-
 * 
 * Element names become object properties
 * Text content of elements goes in the $ property of an object.
 * Nested elements become nested properties
 * Multiple elements at the same level become array elements.
 * Attributes go in properties whose names begin with @.
 * Active namespaces for an element go in the element's @xmlns property.
 * The default namespace URI goes in @xmlns.$.
 * Other namespaces go in other properties of @xmlns.
 * Elements with namespace prefixes become object properties, too.
 * The @xmlns property goes only in object relative to the element where namespace was declared.
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
   * constructs, however, I don't see any advantage in spending time making it better,
   * its tested, it works and its close enough to the original for any afficionados in
   * this area to spot flaws in it and improve it.
   */
  Map _transform(var node) {
    
    var json = {};
    
    var cloneNS = (ns){
        var nns = {};
        if ( ns.isNotEmpty ) {
          for (var n in ns) {
            if (ns.hasOwnProperty(n)) {
                nns[n] = ns[n];
            }
          }
        }
        return nns;
    };
    
    process(var node, var obj, var ns) {
      
      String marker = '"\$"';
      
      if (node.runtimeType.toString() == "XmlText") {
        
        /* Text node processing */
        if (obj["$marker"].runtimeType == "List") {
          obj["$marker"].add(node.nodeValue);
        } else if (obj["$marker"].runtimeType == "LinkedHashMap") {
          obj["$marker"] = [obj["$marker"], node.nodeValue];
        } else {
          obj["$marker"] = '"'+node.data+'"';
        }
      
      } else if (node.runtimeType.toString() == "XmlElement") {
        
        /* Element node processing */ 
        var p = {};
        var nodeName = "\"${node.name}\"";
        for (var i = 0; i < node.attributes.length; i++) {
                
          var attr = node.attributes[i];
          var name = attr.name.local;
          var value = attr.value;
          if (name == "xmlns") {
            ns["$marker"] = '"'+value+'"';
          } else if (name.indexOf("xmlns:") == 0) {
            ns[name.substr(name.indexOf(":") + 1)] = '"'+value+'"';
          } else {
            String indexName = '"@$name"';
            p[indexName] = '"'+value+'"';
          }
         }
        
         if ( ns.isNotEmpty ) {
          for (var prefix in ns) {
            if (ns.hasOwnProperty(prefix)) {
              p["@xmlns"] = p["@xmlns"] || {};
              p["@xmlns"][prefix] = ns[prefix];
            }
           }
         }
         
         if (obj[nodeName].runtimeType == "List") {
          obj[nodeName].add(p);
         } else if (obj[nodeName].runtimeType.toString() == "LinkedHashMap" ) {
          obj[nodeName] = [obj[nodeName], p];
         } else {
          obj[nodeName] = p;
         }
         for (var j = 0; j < node.children.length; j++) {
          process(node.children[j], p, cloneNS(ns));
         }
         
      } else if (node.runtimeType.toString() == "XmlDocument") {
        
          /* Document node processing */
          for (var k = 0; k < node.children.length; k++) {
            process(node.children[k], obj, cloneNS(ns));
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
    
    String json = null;
    try {
      
      _transform(xmlNode);
      
    } catch(e) {
      
      throw new Xml2JsonException("Badgerfish internal transform error => ${e.toString()}");
    }
    
    return json;
    
  }
  
  
}