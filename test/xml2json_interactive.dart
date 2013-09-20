/*
 * Packge : xml2json
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

void reportError(String error ) {
  
  PreElement theError = new PreElement();
  theError.text = error;
  errorArea.children.add(theError);
  
}
void doTransform(e) {
  
  Xml2Json xmlTransformer = new Xml2Json();
  String theXml = xmlElement.value;
  try {
    xmlTransformer.parse(theXml);
  } catch(e) {
    reportError(e.toString());
    return;
  }
  
  String selection = null;
  
  queryAll('[name="transformer"]').forEach((InputElement radioButton) {
    
    if ( radioButton.checked ) selection = radioButton.value;
    
  });

  
  switch(selection) {
    
      case 'parker' :
        
        try {
          jsonElement.value = xmlTransformer.toParker();
        } catch (e) {  
          reportError(e.toString());
        }
        break;
      
      case 'badgerfish' :
      
        try {
        jsonElement.value = xmlTransformer.toBadgerfish();
        } catch (e) {  
          reportError(e.toString());
        }
        break; 
      
      case 'gdata' :
      
        try {
          jsonElement.value = xmlTransformer.toGData();
        } catch (e) {  
          reportError(e.toString());
        }
        break;
        
    }
  
}

main() {
  
  
  transformIt.onClick.listen(doTransform);
  clearIt.onClick.listen((e){
    
    jsonElement.value = "";
    errorArea.children.clear();
    
  });
  
}