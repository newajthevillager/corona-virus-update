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

  Future<CoronaCountry> fetchCoronaUpdateOfACountry(String country) async {
    return await coronaDataSource.getCoronaUpdateOfACountry(country);
  }

}
