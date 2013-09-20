# Xml2Json - details of the JSON output of the transformers

The rules each transformer uses are documented below, following that a global rules section describes
rules all the transformers obey.

## Parker 
The Parker transformer follows the rules documented [here](https://code.google.com/p/xml2json-xslt/wiki/TransformingRules)
with the following caveats :-

1. Similar named consecutive elements are grouped under the name of the element, not
   anonymously in an array as in the rules above, so :-
   
   <root><item>1</item><item>2</item><item>three</item></root>
   
   becomes 
   
   {"item":["1","2","three"]} 
   
   NOT 
   
   ["1","2","three"]
   
   as per the rules.
   
   This allows grouped elements to be extracted by name in one go, i.e. from above all the 
   items can be referenced through the 'item' property. This is better for the usage this transform
   is suited to, the parsing of simple list like structures of books, records etc that just happen to
   be in XML.

   ## Badgerfish
   The Badgerfish transformer follows the rules documented [here](http://www.sklar.com/badgerfish/), 
   to summarise :-
   
   1.  Element names become object properties
   2.  Text content of elements goes in the $ property of an object.
   3.  Nested elements become nested properties
   4.  Multiple elements at the same level become named array elements.
   5.  Attributes go in properties whose names begin with @.
   6.  Multiple attributes at the same level become array elements.
   7.  Active namespaces for an element go in the element's @xmlns property.
   8.  The default namespace URI goes in @xmlns.$.
   9.  Other namespaces go in other properties of @xmlns.
   10. Elements with namespace prefixes become object properties, too.
   11. The @xmlns property goes only in the object relative to the element where namespace was declared.
   
 ## GData
 This is the Google Data(GData) format specified [here](https://developers.google.com/gdata/docs/json?csw=1)
 This is basically the same as Badgerfish except that it drops the @ symbol for attributes and 
 uses $t instead of just $ for values, also the XML Processing element is included at the top of the
 transform.
 
 ##Global Rules
 Each transformer implements the following rules :-
 
 1. All JSONoutput is in the form of strings, numeric literals, true and false become strings.
    This allows the output to be 'transmission ready' if needed for RESTful interfaces.
 
 2. XML Comments are ignored.
 
 3. CDATA sections are ignored.
 
 