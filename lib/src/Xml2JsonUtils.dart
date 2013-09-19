/*
 * Packge : Xml2Json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 * General utility class
 * 
 */

part of xml2json;

/**
 * Escape any control characters and quotes for Json encoding 
 */

String escapeTextForJson(String text) {
  
  text = text.replaceAll("\n", "\\\\n");
  text = text.replaceAll("\'", "\\\\'");
  text = text.replaceAll('"',  '\\"');
  text = text.replaceAll("\&", "\\\\&");
  text = text.replaceAll("\r", "\\\\r");
  text = text.replaceAll("\t", "\\\\t");
  text = text.replaceAll("\b", "\\\\f");
  
  return text;
  
}

/**
 * Turn the processing node into a map of values.
 */
Map mapProcessingNode(String text) {
  
  Map nodeMap = new Map<String,String>();
  text = text.trim();
  text = text.replaceAll('"', '');
  List properties = text.split(' ');
  properties.forEach((var element){
    
    List elementList  = element.split('=');
    if ( elementList.length == 2 ) nodeMap[elementList[0]] = elementList[1];
 
  });
  
  return nodeMap;
  
}

