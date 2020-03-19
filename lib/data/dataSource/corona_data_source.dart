import 'package:corona_live/data/models/corona_country.dart';
import 'package:corona_live/data/models/corona_summary.dart';
import 'package:corona_live/res/strings/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoronaDataSource {

  // corona summary
  Future<CoronaSummary> getCoronaSummary() async {
    var response = await http.get(AppConstants.coronaSummeryUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body); // gets response in json
      CoronaSummary summary = CoronaSummary.fromJson(data);
      return summary;
    } else {
      throw Exception();
    }
  }

  // corona affected countries
  Future<List<CoronaCountry>> getCoronaCountries() async {
    var response = await http.get(AppConstants.allCountriesDataUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body); // json data
      List<CoronaCountry> countries =
          CoronaCountryList.fromJson(data).countries;
      return countries;
    } else {
      throw Exception();
    }
  }

  // corona condition of a given country
  Future<CoronaCountry> getCoronaUpdateOfACountry(String country) async {
    var response = await http.get("${AppConstants.allCountriesDataUrl}/$country");
    if (response.statusCode == 200) {
      print("Country Ok");
      var data = json.decode(response.body);
      CoronaCountry coronaCountry = CoronaCountry.fromJson(data);
      return coronaCountry;
    } else {
      print("Country Exception");
      throw Exception();
    }
  }

}
