@TestOn('vm')

import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  test('Incorrect transform', () {
    const input = "<Result>"
        "<ErrorNo>0</ErrorNo>"
        "<Message>Success</Message>"
        "<Rows>"
        "<R>"
        "<C>"
        "<FA>1</FA>"
        "<SA>0</SA>"
        "<RE>1</RE>"
        "</C>"
        "<C>19072023011</C>"
        "<C>Hiragappa shivappa Naduvinaker</C>"
        "<C>600</C>"
        "<C>SUGAR PACKING    1KG POUCH,SUGAR PACK</C>"
        "<C>RTGS</C>"
        "<C>3000</C>"
        "<C>-</C>"
        "<C>00010010000122</C>"
        "<C>KVGB0003211</C>"
        "<C>23/08/2023</C>"
        "<C>KARIBASAPPA B C</C>"
        "<C>10,000.00 Dr</C>"
        "<C>89113391461</C>"
        "<C>CA</C>"
        "<C> </C>"
        "<C>Pending</C>"
        "<C> </C>"
        "</R>"
        "<R>"
        "<C>"
        "<FA>1</FA>"
        "<SA>0</SA>"
        "<RE>1</RE>"
        "</C>"
        "<C>19072023012</C>"
        "<C>MSM Services</C>"
        "<C>650</C>"
        "<C>CATRIDGE REFILL AND DRUM 2NOS</C>"
        "<C>Internal</C>"
        "<C>3000</C>"
        "<C>-</C>"
        "<C>00010010000123</C>"
        "<C>ICIC0002815</C>"
        "<C>23/08/2023</C>"
        "<C>SHIVALEELA B S</C>"
        "<C>30,000.00 Dr</C>"
        "<C>12458689521</C>"
        "<C>CA</C>"
        "<C> </C>"
        "<C>Pending</C>"
        "<C> </C>"
        "</R>"
        "</Rows>"
        "</Result>";

    const expected = '{"Result": {"ErrorNo": 0,"Message": "Success","Rows": {"R": [{"C": [{"FA": 1,"SA": 0,"RE": 1},19072023011,"Hiragappa shivappa Naduvinaker",600,"SUGAR PACKING 1KG POUCH,SUGAR PACK","RTGS",3000,"-",10010000122,"KVGB0003211","23/08/2023","KARIBASAPPA B C","10,000.00 Dr",89113391461,"CA","","Pending",""]},{"C": [{"FA": 1,"SA": 0,"RE": 1},19072023012,"MSM Services",650,"CATRIDGE REFILL AND DRUM 2NOS","Internal",3000,"-",10010000123,"ICIC0002815","23/08/2023","SHIVALEELA B S","30,000.00 Dr",12458689521,"CA","","Pending",""]}]}}}';

    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toParker();
    print(jsonResponse);
    expect(jsonResponse, expected);
  });
}
