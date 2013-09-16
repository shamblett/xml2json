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
   
  
  /* Group 1 - XML parse tests */
  group("1. Parse not performed  - ", () {
    
    
    /* Initialise */
    Xml2Json myTransformer = new Xml2Json();
    
    test("Badgerfish", () {  
         
      expect(()=> myTransformer.toBadgerfish(),
          throwsA(new isInstanceOf<Xml2JsonException>('toBadgerfish - no parse result')));

      
      
    }); 

    test("Parker", () {  
      
      expect(()=> myTransformer.toParker(),
          throwsA(new isInstanceOf<Xml2JsonException>('toParker - no parse result')));
      
      
    }); 

    test("Spark", () {  
      
      expect(()=> myTransformer.toSpark(),
          throwsA(new isInstanceOf<Xml2JsonException>('toSpark - no parse result')));
      
      
    }); 
    
    test("GData", () {  
      
      expect(()=> myTransformer.toGData(),
          throwsA(new isInstanceOf<Xml2JsonException>('toGData - no parse result')));
      
      
    }); 



  });  
 
  /* Group 2 - XML Parsing */
  group("2. XML Parse - ", () {
    
    /* Initialise */
    Xml2Json myTransformer = new Xml2Json();
    
    test("Invalid XML", () {  
        
      expect(()=> myTransformer.parse(rubbishXmlString),
          throwsA(new isInstanceOf<Xml2JsonException>()));
      
      
    }); 
    
    test("Invalid XML Badgerfish", () {  
      
      expect(()=> myTransformer.toBadgerfish(),
          throwsA(new isInstanceOf<Xml2JsonException>('toBadgerfish - parse has failed')));

      
      
    }); 

    test("Invalid XML Parker", () {  
      
      expect(()=> myTransformer.toParker(),
          throwsA(new isInstanceOf<Xml2JsonException>('toParker - parse has failed')));
      
      
    }); 

    test("Invalid XML Spark", () {  
      
      expect(()=> myTransformer.toSpark(),
          throwsA(new isInstanceOf<Xml2JsonException>('toSpark - parse has failed')));
      
      
    }); 
    
    test("Invalid XML GData", () {  
      
      expect(()=> myTransformer.toGData(),
          throwsA(new isInstanceOf<Xml2JsonException>('toGData - parse has failed')));
      
      
    }); 
    
    test("Valid XML", () {  
      
      myTransformer.parse(goodXmlString);
      var result = myTransformer.xmlParserResult;
      bool success = result.isSuccess;
      expect(success, isTrue);
      
    }); 
    
    test("Valid CMIS ATOM Feed", () {  
      
      myTransformer.parse(cmisAtomXmlString);
      var result = myTransformer.xmlParserResult;
      bool success = result.isSuccess;
      expect(success, isTrue);
      
    }); 
    
    
  });
  
  /* Group 3 - Badgerfish*/
  solo_group("3. Badgerfish - ", () {
    
    /* Initialise */
    Xml2Json myTransformer = new Xml2Json();
    
    test("Parse Simple test string", () {  
      
      myTransformer.parse(goodXmlString );
      bool result = myTransformer.xmlParserResult.isSuccess;
      expect(result, isTrue);
      
    });
    
    test("Transform Simple test string", () {  
      
      String json = myTransformer.toBadgerfish();
      expect(json.replaceAll(' ',''), equals(badgerfishSimpleJsonCheckString.replaceAll(' ','')));
      
    });
    
    test("Parse Complex test string", () {  
      
      myTransformer.parse(complexXmlTestString);
      bool result = myTransformer.xmlParserResult.isSuccess;
      expect(result, isTrue);
      
    });
    
    test("Transform Complex test string", () {  
      
      String json = myTransformer.toBadgerfish();
      print(json);
      expect(json.replaceAll(' ',''), equals(badgerfishComplexJsonCheckString.replaceAll(' ','')));
     
    });
    
  });
  
}