/*
 * Packge : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 */

import 'package:xml2json/xml2json.dart';

import 'dart:convert';
import 'package:test/test.dart';
import 'xml2json_test_strings.dart';
void main(){

  /* Group 1 - XML parse tests */
  group("1. Parse not performed  - ", () {
    
    
    /* Initialise */
    final Xml2Json myTransformer = new Xml2Json();
    
    test("Badgerfish", () {  
         
      expect(myTransformer.toBadgerfish(),
          throwsA(new Xml2JsonException('toBadgerfish - no parse result')));

      
      
    }); 

    test("Parker", () {  
      
      expect(myTransformer.toParker(),
          throwsA(new Xml2JsonException('toParker - no parse result')));
      
      
    }); 

    
    test("GData", () {  
      
      expect(myTransformer.toGData(),
          throwsA(new Xml2JsonException('toGData - no parse result')));
      
      
    }); 



  });  
 
  /* Group 2 - XML Parsing */
  group("2. XML Parse - ", () {
    
    /* Initialise */
    final Xml2Json myTransformer = new Xml2Json();
    
    test("Invalid XML", () {  
        
      expect(()=> myTransformer.parse(rubbishXmlString),
          throwsA(new isInstanceOf<Xml2JsonException>()));
      
      
    }); 
    
    test("Invalid XML Badgerfish", () {  
      
      expect(myTransformer.toBadgerfish(),
          throwsA(new Xml2JsonException('toBadgerfish - parse has failed')));

      
      
    }); 

    test("Invalid XML Parker", () {  
      
      expect(myTransformer.toParker(),
          throwsA(new Xml2JsonException('toParker - parse has failed')));
      
      
    }); 

    test("Invalid XML GData", () {  
      
      expect(myTransformer.toGData(),
          throwsA(new Xml2JsonException('toGData - parse has failed')));
      
      
    }); 
    
    test("Valid XML", () {  
      
      myTransformer.parse(goodXmlString);
      final result = myTransformer.xmlParserResult;
      expect(result, isNot(isNull));
      
    }); 
    
    test("Valid CMIS ATOM Feed", () {  
      
      myTransformer.parse(cmisAtomXmlString);
      final result = myTransformer.xmlParserResult;
      expect(result, isNot(isNull));
      
    }); 
    
    
  });
  
  /* Group 3 - Badgerfish */
  group("3. Badgerfish - ", () {
    
    /* Initialise */
    final Xml2Json myTransformer = new Xml2Json();
    
    test("Parse Simple test string", () {  
      
      myTransformer.parse(goodXmlString );
      final result = myTransformer.xmlParserResult;
      expect(result, isNot(isNull));
      
    });
    
    test("Transform Simple test string", () {  
      
      final String json = myTransformer.toBadgerfish();
      expect(json.replaceAll(' ',''), equals(badgerfishSimpleJsonCheckString.replaceAll(' ','')));
      /* Re parse just to check */
      expect(JSON.encode(json), isNot(throwsA(new isInstanceOf<FormatException>())));
      
    });
    

    test("Parse Complex test string", () {  
      
      myTransformer.parse(complexXmlTestString);
      final result = myTransformer.xmlParserResult;
      expect(result, isNot(isNull));
      
    });
    
    test("Transform Complex test string", () {  
      
      final String json = myTransformer.toBadgerfish();
      expect(json.replaceAll(' ',''), equals(badgerfishComplexJsonCheckString.replaceAll(' ','')));
      /* Re parse just to check */
      expect(JSON.encode(json), isNot(throwsA(new isInstanceOf<FormatException>())));
     
    });
    
  });
  
  /* Group 4 - Parker */
  group("4. Parker - ", () {
    
    /* Initialise */
    final Xml2Json myTransformer = new Xml2Json();
    
    test("Parse Simple test string", () {  
      
      myTransformer.parse(goodXmlString );
      final result = myTransformer.xmlParserResult;
      expect(result, isNot(isNull));
      
    });
    
    test("Transform Simple test string", () {  
      
      final String json = myTransformer.toParker();
      expect(json.replaceAll(' ',''), equals(parkerSimpleJsonCheckString.replaceAll(' ','')));
      /* Re parse just to check */
      expect(JSON.encode(json), isNot(throwsA(new isInstanceOf<FormatException>())));
      
    });
    

    test("Parse Complex test string", () {  
      
      myTransformer.parse(complexXmlTestString);
      final result = myTransformer.xmlParserResult;
      expect(result, isNot(isNull));
      
    });
    
    test("Transform Complex test string", () {  
      
      final String json = myTransformer.toParker();
      expect(json.replaceAll(' ',''), equals(parkerComplexJsonCheckString.replaceAll(' ','')));      
      /* Re parse just to check */
      expect(JSON.encode(json), isNot(throwsA(new isInstanceOf<FormatException>())));
     
    });
    
  });
  
  /* Group 5 - GData */
  group("5. GData - ", () {
    
    /* Initialise */
    final Xml2Json myTransformer = new Xml2Json();
    
    test("Parse Simple test string", () {  
      
      myTransformer.parse(goodXmlString );
      final result = myTransformer.xmlParserResult;
      expect(result, isNot(isNull));
      
    });
    
    test("Transform Simple test string", () {  
      
      final String json = myTransformer.toGData();
      expect(json.replaceAll(' ',''), equals(gDataSimpleJsonCheckString.replaceAll(' ','')));
      /* Re parse just to check */
      expect(JSON.encode(json), isNot(throwsA(new isInstanceOf<FormatException>())));
      
    });
    

    test("Parse Complex test string", () {  
      
      myTransformer.parse(gDatacomplexXmlTestString);
      final result = myTransformer.xmlParserResult;
      expect(result, isNot(isNull));
      
    });
    
    test("Transform Complex test string", () {  
      
      final String json = myTransformer.toGData();
      expect(json.replaceAll(' ',''), equals(gDataComplexJsonCheckString.replaceAll(' ','')));
      /* Re parse just to check */
      expect(JSON.encode(json), isNot(throwsA(new isInstanceOf<FormatException>())));
     
    }); 
    
  });
  
  
}