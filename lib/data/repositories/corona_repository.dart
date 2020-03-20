import 'package:corona_live/data/dataSource/corona_data_source.dart';
import 'package:corona_live/data/models/corona_country.dart';
import 'package:corona_live/data/models/corona_summary.dart';
import 'package:meta/meta.dart';

class CoronaRepository {

  CoronaDataSource coronaDataSource;
  
  CoronaRepository({@required this.coronaDataSource});

  Future<CoronaSummary> fetchCoronaSummary() async {
    return await coronaDataSource.getCoronaSummary();
  }

  Future<List<CoronaCountry>> fetchCoronaCountries() async {
    return await coronaDataSource.getCoronaCountries();
  }

  List<CoronaCountry> fetchFilteredCountries(String text, List<CoronaCountry> countries) {
    return coronaDataSource.getFilteredCountries(text, countries);
  }

}
