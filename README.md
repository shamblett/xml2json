# xml2json

[![Build Status](https://github.com/shamblett/xml2json/actions/workflows/ci.yml/badge.svg)](https://github.com/shamblett/xml2json/actions/workflows/ci.yml)

An XML to JSON conversion package.

This package allows the parsing of XML strings and the transformation of the resulting parse
tree into the following XML JSON conventions :-

1. Parker(optionally with attributes)
2. Badgerfish
3. Google Data(GData).
4. OpenRally

The package uses the [xml](https://pub.dev/packages/xml) parser to perform the parsing of XML data into a parse tree.

Exact transforming rules can be found below.

The Parker convention is a lossy but lean conversion from XML into JSON, ideal for lightweight
XML parsing of collections of books, records etc. where attributes and namespace information
is not needed.

Badgerfish and GData both preserve XML information such as attributes and namespaces. These are more
suited to heavyweight XML parsing of say ATOM feeds where this information may be needed.

See the main Xml2Json class for usage.

# Xml2Json - details of the JSON output of the transformers

The rules each transformer uses are documented below, following that a global rules section describes
rules all the transformers obey.

## Parker

The Parker transformer follows the rules documented [here](https://code.google.com/p/xml2json-xslt/wiki/TransformingRules) with the following caveats :-

1. Similar named consecutive elements are grouped under the name of the element, not
   anonymously in an array as in the rules above, so :-

   `<root><item>1</item><item>2</item><item>three</item></root>`

   becomes

   `{"item":["1","2","three"]}`

   NOT

   `["1","2","three"]`

   as per the rules.

   This allows grouped elements to be extracted by name in one go, i.e. from above all the
   items can be referenced through the 'item' property. This is better for the usage this transform
   is suited to, the parsing of simple list like structures of books, records etc that just happen to
   be in XML.
   There is also an alternative Parker transformer that transforms node elements that have attributes.
   The standard Parker transformer should suffice for most use cases.

## Badgerfish

The Badgerfish transformer follows the rules documented [here](http://www.sklar.com/badgerfish/), to summarise :-

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

Badgerfish also has the option of using local xml node names by setting the useLocalNameForNodes parameter to true
when transforming.
This has the effect that since the element key("soapenv" in the example below) is implementation dependent (i.e. one manufacturer
will assign "soapenv as the key, while another might assign "ENV"), using the key in the node name makes the
resulting json from xml2json dependent on the implementation as well.

For example, this xml :-

```xml
<soapenv:Envelope xmlns:soapenv="http://www.w3.org/2003/05/soap-envelope"> <soapenv:Header/> <soapenv:Body>
<tns:getDataResponse xmlns:tns="https://urchin.com/api/urchin/v1/"> <record> <recordId>1</recordId>
<dimensions> <dimension name="u:month">2008-02-00T00:00:00Z</dimension> </dimensions> <metrics>
<u:hits xmlns:u="https://urchin.com/api/urchin/v1/">836</u:hits>
<u:bytes xmlns:u="https://urchin.com/api/urchin/v1/">1953960</u:bytes> </metrics> </record>
</tns:getDataResponse> </soapenv:Body> </soapenv:Envelope>
```

gives this JSON output if useLocalNameForNodes is set true +-

```json
{
  "Envelope": {
    "@xmlns": [{ "soapenv": "http://www.w3.org/2003/05/soap-envelope" }],
    "Header": {},
    "Body": {
      "getDataResponse": {
        "@xmlns": [{ "tns": "https://urchin.com/api/urchin/v1/" }],
        "record": {
          "recordId": { "$": "1" },
          "dimensions": {
            "dimension": { "@name": "u:month", "$": "2008-02-00T00:00:00Z" }
          },
          "metrics": {
            "hits": {
              "@xmlns": [{ "u": "https://urchin.com/api/urchin/v1/" }],
              "$": "836"
            },
            "bytes": {
              "@xmlns": [{ "u": "https://urchin.com/api/urchin/v1/" }],
              "$": "1953960"
            }
          }
        }
      }
    }
  }
}
```

if set to false(default) this JSON response is given :-

```json
{
  "soapenv:Envelope": {
    "@xmlns": [{ "soapenv": "http://www.w3.org/2003/05/soap-envelope" }],
    "soapenv:Header": {},
    "soapenv:Body": {
      "tns:getDataResponse": {
        "@xmlns": [{ "tns": "https://urchin.com/api/urchin/v1/" }],
        "record": {
          "recordId": { "$": "1" },
          "dimensions": {
            "dimension": { "@name": "u:month", "$": "2008-02-00T00:00:00Z" }
          },
          "metrics": {
            "u:hits": {
              "@xmlns": [{ "u": "https://urchin.com/api/urchin/v1/" }],
              "$": "836"
            },
            "u:bytes": {
              "@xmlns": [{ "u": "https://urchin.com/api/urchin/v1/" }],
              "$": "1953960"
            }
          }
        }
      }
    }
  }
}
```

## GData

This is the Google Data(GData) format specified [here](https://developers.google.com/gdata/docs/json?csw=1)

This is basically the same as Badgerfish except that it drops the @ symbol for attributes and
uses $t instead of just $ for values, also the XML Processing element is included at the top of the
transform.

## OpenRally

This is the Open Rally format specified [here](http://www.topografix.com/GPX/1/1/#SchemaProperties)

This is basically the same as Badgerfish except that it drops the @ symbol for attributes and
uses (key/value) format for values, also the XML Processing element is included at the top of the
transform.

## Global Rules

Each transformer implements the following rules :-

1. All JSON output is in the form of strings, numeric literals, true and false become strings.
   This allows the output to be 'transmission ready' if needed for RESTful interfaces.

2. XML Comments are ignored.

3. CDATA sections are ignored for Parker but translated into '\_\_cdata' properties
   for Badgerfish and GData
