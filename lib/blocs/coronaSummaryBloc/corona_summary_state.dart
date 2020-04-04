import 'package:corona_live/data/models/corona_summary.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CoronaSummaryState extends Equatable {}

class CoronaSummaryInitial extends CoronaSummaryState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CoronaSummaryLoadingState extends CoronaSummaryState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CoronaSummaryLoaded extends CoronaSummaryState {

  final CoronaSummary coronaSummary;

  CoronaSummaryLoaded({@required this.coronaSummary});

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class CoronaSummaryFailure extends CoronaSummaryState {

  String message;

  CoronaSummaryFailure({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => null;

  

}