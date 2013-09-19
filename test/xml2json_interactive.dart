/*
 * Packge : Xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 */

import '../lib/xml2json.dart';

import 'dart:html';

TextAreaElement xmlElement = query('#xmlinput');
TextAreaElement jsonElement = query('#jsonoutput');
RadioButtonInputElement transformerParker = query('#transformerParker');
RadioButtonInputElement transformerBadgerfish = query('#transformerBadgerfish');
RadioButtonInputElement transformerGData = query('#transformerGData');
ButtonElement transformIt = query('#transformIt');
ButtonElement clearIt = query('#clearIt');
DivElement errorArea = query('#errorArea');

void doTransform(e) {
  
  Xml2Json xmlTransformer = new Xml2Json();
  String theXml = xmlElement.value.trim();
  try {
    xmlTransformer.parse(theXml);
  } catch(e) {
    errorArea.innerHtml = e.toString();
    return;
  }
  
  String selection = null;
  
  queryAll('[name="transformer"]').forEach((InputElement radioButton) {
    
    if ( radioButton.attributes.containsKey('checked') ) selection = radioButton.value;
    
  });

  
  switch(selection) {
    
      case 'parker' :
        
        try {
          jsonElement.value = xmlTransformer.toParker();
        } catch (e) {  
          errorArea.innerHtml = e.toString();
        }
        break;
      
      case 'badgerfish' :
      
        try {
        jsonElement.value = xmlTransformer.toBadgerfish();
        } catch (e) {  
          errorArea.innerHtml = e.toString();
        }
        break; 
      
      case 'gdata' :
      
        try {
          jsonElement.value = xmlTransformer.toGData();
        } catch (e) {  
          errorArea.innerHtml = e.toString();
        }
        break;
        
    }
  
}

main() {
  
  
  transformIt.onClick.listen(doTransform);
  clearIt.onClick.listen((e){
    
    jsonElement.value = "";
    errorArea.innerHtml = "";
    
  });
  
}