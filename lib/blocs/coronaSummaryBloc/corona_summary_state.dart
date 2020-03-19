import 'package:corona_live/data/models/corona_country.dart';
import 'package:corona_live/data/models/corona_summary.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CoronaSummaryState extends Equatable {}

class CoronaSummaryInitial extends CoronaSummaryState {
  @override
  List<Object> get props => null;
}

class CoronaSummaryLoading extends CoronaSummaryState {
  @override
  List<Object> get props => null;
}

class CoronaSummaryLoaded extends CoronaSummaryState {
  final CoronaSummary coronaSummary;

  CoronaSummaryLoaded({@required this.coronaSummary});

  @override
  List<Object> get props => null;
}

class CoronaSummaryLoadFailure extends CoronaSummaryState {
  final String message;

  CoronaSummaryLoadFailure({@required this.message});

  @override
  List<Object> get props => null;
}

