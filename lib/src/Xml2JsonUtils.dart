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