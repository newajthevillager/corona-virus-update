import 'package:bloc/bloc.dart';
import 'package:corona_live/blocs/coronaCountriesBloc/corona_countries_event.dart';
import 'package:corona_live/blocs/coronaCountriesBloc/corona_countries_state.dart';
import 'package:corona_live/data/models/corona_country.dart';
import 'package:corona_live/data/repositories/corona_repository.dart';
import 'package:meta/meta.dart';

class CoronaCountriesBloc extends Bloc<CoronaCountriesEvent, CoronaCountriesState> {

  CoronaRepository coronaRepository;

  CoronaCountriesBloc({@required this.coronaRepository});

  List<CoronaCountry> list;

  @override
  // TODO: implement initialState
  CoronaCountriesState get initialState => CoronaCountriesLoading();

  @override
  Stream<CoronaCountriesState> mapEventToState(CoronaCountriesEvent event) async* {
    if (event is FetchCoronaCountries) {
      yield* mapFetchCountriesToEvent(event);
    } else if (event is FilterCountry) {
      yield* mapFilterCountryEventToState(event);
    } else if (event is CrossBtnPressed) {
      yield CoronaCountriesLoaded(countries: list);
    }
  }

  Stream<CoronaCountriesState> mapFetchCountriesToEvent(FetchCoronaCountries event) async* {
    yield CoronaCountriesLoading();
    try {
      list = await coronaRepository.fetchCoronaCountries();
      yield CoronaCountriesLoaded(countries: list);
    } catch (e) {
      yield CoronaCountriesLoadFailure(message: e.toString());
    }
  }

  Stream<CoronaCountriesState> mapFilterCountryEventToState (FilterCountry event) async* {
    yield CoronaCountriesLoading();
    List<CoronaCountry> countries = coronaRepository.fetchFilteredCountries(event.text, event.countries);
    
    if (countries.length > 0) {
      yield FilteredCountries(countries: countries);
    } else {
      yield NoCountriesFound();
    }
  }

}