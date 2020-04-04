class CoronaCountryList {
  List<CoronaCountry> countries;

  CoronaCountryList({this.countries});

  CoronaCountryList.fromJson(List<dynamic> parsedJson) {
    if (parsedJson != null) {
      countries = List<CoronaCountry>();
      countries = parsedJson.map((i) => CoronaCountry.fromJson(i)).toList();
    }
  }
}

class CoronaCountry {
  String country;
  var cases;
  var todayCases;
  var deaths;
  var todayDeaths;
  var recovered;
  var critical;
  var active;
  var casesPerOneMillion;

  CoronaCountry({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.critical,
    this.active,
    this.casesPerOneMillion,
  });

  CoronaCountry.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    critical = json['critical'];
    active = json['active'];
    casesPerOneMillion = json['casesPerOneMillion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['cases'] = this.cases;
    data['todayCases'] = this.todayCases;
    data['deaths'] = this.deaths;
    data['todayDeaths'] = this.todayDeaths;
    data['recovered'] = this.recovered;
    data['critical'] = this.critical;
    data['active'] = this.active;
    data['casesPerOneMillion'] = this.casesPerOneMillion;
    return data;
  }
}
