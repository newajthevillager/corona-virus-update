import 'package:corona_live/blocs/coronaCountriesBloc/corona_countries_event.dart';
import 'package:corona_live/blocs/coronaCountriesBloc/corona_countries_state.dart';
import 'package:corona_live/data/models/corona_country.dart';
import 'package:corona_live/data/repositories/corona_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class CoronaCountriesBloc
    extends Bloc<CoronaCountriesEvent, CoronaCountriesState> {
  CoronaRepository coronaRepository;

  CoronaCountriesBloc({@required this.coronaRepository});
  List<CoronaCountry> list;

  @override
  CoronaCountriesState get initialState => CoronaCountriesLoading();

  @override
  Stream<CoronaCountriesState> mapEventToState(
      CoronaCountriesEvent event) async* {
    if (event is FetchCoronaCountries) {
      yield* _mapCoronaCountriesEventToState(event);
    } else if (event is CoronaUpdateOfACountry) {
      yield* _mapCoronaUpdateOfACountryToState(event);
    } else if (event is CrossBtnPressed) {
      yield CoronaCountriesLoaded(countries: list);
    }
  }

  Stream<CoronaCountriesState> _mapCoronaCountriesEventToState(
      FetchCoronaCountries event) async* {
    print("cpnverting contries");
    yield CoronaCountriesLoading();
    try {
      print("fetching contries");
      list = await coronaRepository.fetchCoronaCountries();
      print("fetched contries ${list.length}");
      yield CoronaCountriesLoaded(countries: list);
    } catch (e) {
      print("error contries");
      yield CoronaCountriesLoadFailure(message: e.toString());
    }
  }

  Stream<CoronaCountriesState> _mapCoronaUpdateOfACountryToState(
      CoronaUpdateOfACountry event) async* {
    yield CountryUpdateLoading();
    try {
      CoronaCountry coronaCountry =
          await coronaRepository.fetchCoronaUpdateOfACountry(event.country);
      yield CountryUpdateLoaded(country: coronaCountry);
    } catch (e) {
      yield CountryUpdateLoadFailure(message: e.toString());
    }
  }
}
