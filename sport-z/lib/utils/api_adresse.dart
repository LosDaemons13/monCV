import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

Future<List> autoComplete(String adresse) async {
  var url = Uri.parse(
      'https://api-adresse.data.gouv.fr/search/?q=$adresse&type=housenumber&autocomplete=1');
  var response = await http.get(url);
  var json = convert.jsonDecode(response.body);
  var predictions = json["features"] as List;
  List result = [];
  for (var prediction in predictions) {
    result.add(prediction["properties"]["label"]);
  }
  return result;
}
