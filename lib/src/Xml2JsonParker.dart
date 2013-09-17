/*
 * Packge : Xml2Json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 * Badgerfish conversion class.
 * 
 * The Parker convention is lossy, it simply ignores XML attributes. 
 * The advantage is that it generates much leaner and cleaner JSON.
 * 
 */

part of xml2json;

class _Xml2JsonParker{
  
  /**
   * Parker transformer function.
   * 
   * This is basically Badgerfish without attributes, which means it may not be suitable
   * for heavy lifting or ATOM parsing.
   */
  Map _transform(var node, var obj) {
    
      if (node.runtimeType.toString() == "XmlElement") {
          
            var nodeName = "\"${node.name.qualified}\"";
            if (obj[nodeName].runtimeType.toString() == "List") {
              obj[nodeName].add({});
              obj = obj[nodeName].last;
            } else if (obj[nodeName].runtimeType.toString() == "LinkedHashMap" ) {
              obj[nodeName] = [obj[nodeName], {}];
              obj = obj[nodeName].last;
            } else { 
              if ( node.children.length >=1 ) {
                if (node.children[0].runtimeType.toString() == "XmlText" ) {
                  String nodeData = '"'+node.children[0].data+'"';
                  if ( nodeData.isEmpty) nodeData = null;
                  obj[nodeName] = nodeData; 
                } else  {
                  obj[nodeName] = {};
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
          
        
      
      } else if (node.runtimeType.toString() == "XmlDocument") {
        
        for (var j = 0; j < node.children.length; j++) { 
          _transform(node.children[j], obj);
        }
        
      }
         
     return obj;
     
  }
  
  /**
   * Transformer function
   */
  String transform(var xmlNode) {
    
    Map json = null;
    try {
      
      json = _transform(xmlNode, {});
      
    } catch(e) {
      
      throw new Xml2JsonException("Parker internal transform error => ${e.toString()}");
    }
    
    return json.toString();
    
  }
  
}
