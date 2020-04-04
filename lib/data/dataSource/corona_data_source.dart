import 'dart:convert';

import 'package:corona_live/data/models/corona_country.dart';
import 'package:corona_live/data/models/corona_summary.dart';
import 'package:corona_live/res/strings/app_strings.dart';
import 'package:http/http.dart' as http;

class CoronaDataSource {

  Future<CoronaSummary> getCoronaSummary() async {
    var response = await http.get(AppString.corona_summary_url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      CoronaSummary coronaSummary = CoronaSummary.fromJson(data);
      return coronaSummary;
    } else {
      throw Exception();
    }
  }

  Future<List<CoronaCountry>> getCoronaCountries() async {
    var response =  await http.get(AppString.corona_countries_url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<CoronaCountry> countries = CoronaCountryList.fromJson(data).countries;
      return countries;
    } else {
      throw Exception();
    }
  }

  List<CoronaCountry> getFilteredCountries(String text, List<CoronaCountry> countries) {
    if (countries.length == 0) {
      return [];
    } else {
      List<CoronaCountry> list = countries.where((country) => country.country.toLowerCase().contains(text.trim().toLowerCase()))
      .toList();
      return list;
    }
  }
  
}