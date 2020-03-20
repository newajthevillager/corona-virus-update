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
    } else if (event is FilterCountry) {
      print("Event added");
      yield* _mapFilterCountryToState(event);
    } else if (event is CrossBtnPressed) {
      yield CoronaCountriesLoaded(countries: list);
    }
  }

  // fetch all corona affected countries
  Stream<CoronaCountriesState> _mapCoronaCountriesEventToState(
      FetchCoronaCountries event) async* {
    yield CoronaCountriesLoading();
    try {
      list = await coronaRepository.fetchCoronaCountries();
      yield CoronaCountriesLoaded(countries: list);
    } catch (e) {
      yield CoronaCountriesLoadFailure(message: e.toString());
    }
  }

  // filter countries
  Stream<CoronaCountriesState> _mapFilterCountryToState(
      FilterCountry event) async* {
        print("loading");
    yield CoronaCountriesLoading();
    List<CoronaCountry> filteredCountries =
        coronaRepository.fetchFilteredCountries(event.text, event.countries);
    if (filteredCountries.length > 0) {
      print("yielsing");
      yield FilteredCountries(countries: filteredCountries);
    } else {
      print("not found");
      yield NoCountryFound();
    }
  }
}
