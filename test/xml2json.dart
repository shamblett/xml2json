/*
 * Packge : Xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 */

import '../lib/xml2json.dart';

import 'package:unittest/unittest.dart';  
import 'package:unittest/html_config.dart';
import 'xml2json_test_strings.dart';
main(){
   
  useHtmlConfiguration();
   
  /* Tests */
  
  /* Group 1 - XML parse tests */
  group("1. XML string not parsed  - ", () {
    
    
    /* Initialise */
    Xml2Json myTransformer = new Xml2Json();
    
    test("Not Parsed Badgerfish", () {  
         
      expect(()=> myTransformer.toBadgerfish(),
          throwsA(new isInstanceOf<Xml2JsonException>('toBadgerfish - no parse result')));

      
      
    }); 

    test("Not Parsed Parker", () {  
      
      expect(()=> myTransformer.toParker(),
          throwsA(new isInstanceOf<Xml2JsonException>('toParker - no parse result')));
      
      
    }); 

    test("Not Parsed Spark", () {  
      
      expect(()=> myTransformer.toSpark(),
          throwsA(new isInstanceOf<Xml2JsonException>('toSpark - no parse result')));
      
      
    }); 
    
    test("Not Parsed GData", () {  
      
      expect(()=> myTransformer.toGData(),
          throwsA(new isInstanceOf<Xml2JsonException>('toGData - no parse result')));
      
      
    }); 



  });  
 
  /* Group 2 - Badgerfish */
  group("2. XML Parse tests - ", () {
    
    
    
    //test("Transform", () {  
        
      
      //expect(wrapper,throwsA(new isInstanceOf<WiltException>()));
      
      
    //}); 
    
    
  });
  
}