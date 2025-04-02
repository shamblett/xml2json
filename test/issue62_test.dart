@TestOn('vm')
library;

import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  const input =
      "<Abstract>"
      "<AbstractText>"
      "<b>Introduction</b>"
      ": Transdermal drug delivery has several clinical benefits over conventional routes of drug administration. To open the transdermal route for a wider range of drugs, including macromolecules, numerous physical and chemical techniques to overcome the natural low skin permeability have been developed."
      "<b>Areas covered</b>"
      ": This review focuses on permeation enhancers (penetration enhancers, percutaneous absorption promoters or accelerants), which are chemicals that increase drug flux through the skin barrier. First, skin components, drug permeation pathways, and drug properties are introduced. Next, we discuss properties of enhancers, their various classifications, structure-activity relationships, mechanisms of action, reversibility and toxicity, biodegradable enhancers, and synergistic enhancer combinations."
      "<b>Expert opinion</b>"
      ": Overcoming the remarkable skin barrier properties in an efficient, temporary and safe manner remains a challenge. High permeation-enhancing potency has long been perceived to be associated with toxicity and irritation potential of such compounds, which has limited their further development. In addition, the complexity of enhancer interactions with skin, formulation and drug, along with their vast chemical diversity hampered understanding of their mechanisms of action. The recent development in the field revealed highly potent yet safe enhancers or enhancer combinations, which suggest that enhancer-aided transdermal drug delivery has yet to reach its full potential."
      "</AbstractText>"
      "</Abstract>";

  test('Fixed Badgerfish', () {
    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toBadgerfish();
    expect(
      jsonResponse,
      '{"Abstract": {"AbstractText": {"b": [{"\$": "Introduction"}, {"\$": "Areas covered"}, {"\$": "Expert opinion"}], "\$": ": Transdermal drug delivery has several clinical benefits over conventional routes of drug administration. To open the transdermal route for a wider range of drugs, including macromolecules, numerous physical and chemical techniques to overcome the natural low skin permeability have been developed."": This review focuses on permeation enhancers (penetration enhancers, percutaneous absorption promoters or accelerants), which are chemicals that increase drug flux through the skin barrier. First, skin components, drug permeation pathways, and drug properties are introduced. Next, we discuss properties of enhancers, their various classifications, structure-activity relationships, mechanisms of action, reversibility and toxicity, biodegradable enhancers, and synergistic enhancer combinations."": Overcoming the remarkable skin barrier properties in an efficient, temporary and safe manner remains a challenge. High permeation-enhancing potency has long been perceived to be associated with toxicity and irritation potential of such compounds, which has limited their further development. In addition, the complexity of enhancer interactions with skin, formulation and drug, along with their vast chemical diversity hampered understanding of their mechanisms of action. The recent development in the field revealed highly potent yet safe enhancers or enhancer combinations, which suggest that enhancer-aided transdermal drug delivery has yet to reach its full potential."}}}',
    );
  });

  test('Fixed GData', () {
    final xmlParser = Xml2Json();
    xmlParser.parse(input);
    var jsonResponse = xmlParser.toGData();
    expect(
      jsonResponse,
      '{"Abstract": {"AbstractText": {"b": [{"\$t": "Introduction"}, {"\$t": "Areas covered"}, {"\$t": "Expert opinion"}], "\$t": ": Transdermal drug delivery has several clinical benefits over conventional routes of drug administration. To open the transdermal route for a wider range of drugs, including macromolecules, numerous physical and chemical techniques to overcome the natural low skin permeability have been developed."": This review focuses on permeation enhancers (penetration enhancers, percutaneous absorption promoters or accelerants), which are chemicals that increase drug flux through the skin barrier. First, skin components, drug permeation pathways, and drug properties are introduced. Next, we discuss properties of enhancers, their various classifications, structure-activity relationships, mechanisms of action, reversibility and toxicity, biodegradable enhancers, and synergistic enhancer combinations."": Overcoming the remarkable skin barrier properties in an efficient, temporary and safe manner remains a challenge. High permeation-enhancing potency has long been perceived to be associated with toxicity and irritation potential of such compounds, which has limited their further development. In addition, the complexity of enhancer interactions with skin, formulation and drug, along with their vast chemical diversity hampered understanding of their mechanisms of action. The recent development in the field revealed highly potent yet safe enhancers or enhancer combinations, which suggest that enhancer-aided transdermal drug delivery has yet to reach its full potential."}}}',
    );
  });
}
