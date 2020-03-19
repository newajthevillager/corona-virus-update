import 'package:corona_live/data/models/corona_country.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CoronaCountriesState extends Equatable {}

class CoronaCountriesLoading extends CoronaCountriesState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CoronaCountriesLoaded extends CoronaCountriesState {

  final List<CoronaCountry> countries;

  CoronaCountriesLoaded({@required this.countries});

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class CoronaCountriesLoadFailure extends CoronaCountriesState {

  final String message;

  CoronaCountriesLoadFailure({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class CountryUpdateLoading extends CoronaCountriesState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CountryUpdateLoaded extends CoronaCountriesState {

  final CoronaCountry country;

  CountryUpdateLoaded({@required this.country});

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CountryUpdateLoadFailure extends CoronaCountriesState {

  final String message;

  CountryUpdateLoadFailure({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => null;
}

// not used yet
class CountryNotFound extends CoronaCountriesState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

