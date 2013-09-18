/*
 * Packge : Xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 * 
 * The Xml2Json class provids a means of parsing XML data and transforming the
 * resultant element tree into the following popular JSON XML formats :-
 * 
 * Parker(plus)
 * Badgerfish
 * GData
 * 
 * The XML parser used is the one supplied by the petitparser package.
 * 
 * Functionality splits XML parsing out from transformation to JSON so as to allow
 * clients to extract intermediate results if needed and to transform into more than
 * one JSON XML format without re-parsing.
 * 
 * Note this package is intended for use as a one way transform only, it does not
 * guarantee the resulting Json string can be parsed back into valid XML.
 * 
 * See the individual transform classes for further documentation, however, all
 * the transform functions convert XML data into JSON strings, so numbers such as
 * <mynumber>150</mynumber> become { "mynumber" : "150" } not { "mynumber" : 150 }
 * 
 * If your translating from ATOM then Badgerfish and GData are the better ones
 * to use as they are less lossy.
 * 
 * Usage is :-
 * 
 * Xml2Json jsonTransform = new Xml2Json();
 * jsonTransform.parse(xmlString);
 * String jsonString = jsonTransform.toXxxxxxx();
 *  
 *  Any exceptions thrown by the parser/transformers are re-thrown as instances of
 *  Xml2JsonException. 
 */

part of xml2json;

class Xml2Json {

  /**
   * XML parser
   */
  XmlParser _xmlParser = new XmlParser();
  get xmlParser => _xmlParser;
  
  /**
   * Parser result
   */
  Result _result = null;
  get xmlParserResult => _result;
  
  /**
   * Parse an XML string
   */
  void parse(String xmlString) {
    
    try {
      
      _result = _xmlParser.parse(xmlString);
      if ( _result.isFailure ) {
        
        throw new Xml2JsonException("parse error - invalid XML");
        
      }
      
    } catch(e) {
      
      throw new Xml2JsonException("parse error => ${e.toString()}");
    }
    
  }
  
  /**
   * JSON transformers 
   * 
   */
  
  /**
   * Badgerfish
   */
  String toBadgerfish() {
    
    if ( _result == null ) {
      
      throw new Xml2JsonException("toBadgerfish - no parse result");
    }
    
    if ( _result.isFailure ) {
      
      throw new Xml2JsonException("toBadgerfish - no parse has failed");
    }
    
    String json = null;
    _Xml2JsonBadgerfish badgerfishTransformer = new _Xml2JsonBadgerfish();
    try {
      
      json = badgerfishTransformer.transform(_result.value);
      
    } catch(e) {
      
      throw new Xml2JsonException("toBadgerfish error => ${e.toString()}");
    }
    
    return json;
    
  }
  
  /**
   * Parker
   */
  String toParker() {
    
    if ( _result == null ) {
      
      throw new Xml2JsonException("toParker - no parse result");
    }
    
    if ( _result.isFailure) {
      
      throw new Xml2JsonException("toParker - parse has failed");
    }
    
    String json = null;
    _Xml2JsonParker parkerTransformer = new _Xml2JsonParker();
    try {
      
      json = parkerTransformer.transform(_result.value);
      
    } catch(e) {
      
      throw new Xml2JsonException("toParker error => ${e.toString()}");
    }
    
    return json;
    
    
  }
  
  /**
   * GData
   */
  String toGData() {
    
    if ( _result == null ) {
      
      throw new Xml2JsonException("toGData - no parse result");
    }
    
    if ( _result.isFailure ) {
      
      throw new Xml2JsonException("toGData - parse has failed");
    }

  }
  
  
}