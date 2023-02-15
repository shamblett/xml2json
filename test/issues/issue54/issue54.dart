@TestOn('vm')
import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() async {
  Directory parkerAssetsDirectory = Directory("test/issues/issue54/unittests");
  Iterable<File> xmlFiles = (await parkerAssetsDirectory
          .list()
          .where((event) => event is File)
          .toList())
      .cast<File>()
      .where((element) => element.path.endsWith("xml"));
  print(xmlFiles);
  await Future.forEach(xmlFiles, testXmlFile);
}

Future<void> testXmlFile(File xmlFile) async {
  String xmlFilePath = xmlFile.path;
  String jsonFilePath =
      "${xmlFilePath.substring(0, xmlFilePath.length - 3)}json.expected";
  File jsonFile = File(jsonFilePath);
  String jsonFileContent = await jsonFile.readAsString();
  String xmlFileContent = await xmlFile.readAsString();

  test("Parker conversion of $xmlFilePath", () {
    final xmlParser = Xml2Json();
    xmlParser.parse(xmlFileContent);
    var jsonResponse = xmlParser.toParker();
    expect(jsonDecode(jsonResponse), jsonDecode(jsonFileContent));
  });
}
