// ignore_for_file: avoid_function_literals_in_foreach_calls, camel_case_types

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class autoComplete {
  final key = "AIzaSyD3Kz1GnGLYatfOyqrazTHg2qb_RLTcngo";
  Future<List> getAutoComplete(String input) async {
    var url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&language=fr&components=country:fr&types=geocode&key=$key";
    var result = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(result.body);
    var predictions = json['predictions'] as List;
    List results = [];
    predictions.forEach((element) {
      results.add(element["description"]);
    });
    return results;
  }
}
