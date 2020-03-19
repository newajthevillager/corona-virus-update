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

class CrossBtnPressed extends CoronaCountriesEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}