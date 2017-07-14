
# xml2json
[![Build Status](https://travis-ci.org/shamblett/xml2json.svg?branch=master)](https://travis-ci.org/shamblett/xml2json)

An XML to JSON conversion package.

This package allows the parsing of XML strings and the transformation of the resulting parse 
tree into the following XML JSON conventions :-

1. Parker
2. Badgerfish
3. Google Data(GData).

The package uses the [petitparser](http://pub.dartlang.org/packages/petitparser) XML parser to peform the parsing of XML data into a parse tree.

Exact transforming rules can be found in the 'Transforming Details' document in the docs folder.

The Parker convention is a lossy but lean conversion from XML into JSON, ideal for lightweight
XML parsing of collections of books, records etc. where attributes and namespace information
is not needed.

Badgerfish and GData both preserve XML information such as attributes and namespaces. These are more
suited to heavyweight XML parsing of say ATOM feeds where this information may be needed.

See the main Xml2Json class for usage.

