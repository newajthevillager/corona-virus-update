import 'package:corona_live/data/models/corona_country.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CoronaCountriesEvent extends Equatable {}


class FetchCoronaCountries extends CoronaCountriesEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CoronaUpdateOfACountry extends CoronaCountriesEvent {

  final String country;

  CoronaUpdateOfACountry({@required this.country});

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FilterCountry extends CoronaCountriesEvent {

  final String text;
  final List<CoronaCountry> countries;

  FilterCountry({@required this.text, this.countries});

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CrossBtnPressed extends CoronaCountriesEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}