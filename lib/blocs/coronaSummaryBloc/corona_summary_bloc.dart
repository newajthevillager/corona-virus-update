import 'package:bloc/bloc.dart';
import 'package:corona_live/blocs/coronaSummaryBloc/corona_summary_event.dart';
import 'package:corona_live/blocs/coronaSummaryBloc/corona_summary_state.dart';
import 'package:corona_live/data/models/corona_country.dart';
import 'package:corona_live/data/models/corona_summary.dart';
import 'package:corona_live/data/repositories/corona_repository.dart';
import 'package:meta/meta.dart';

class CoronaSummaryBloc extends Bloc<CoronaSummaryEvent, CoronaSummaryState> {
  CoronaRepository coronaRepository;

  CoronaSummaryBloc({@required this.coronaRepository});

  @override
  CoronaSummaryState get initialState => CoronaSummaryInitial();

  @override
  Stream<CoronaSummaryState> mapEventToState(CoronaSummaryEvent event) async* {
    if (event is FetchCoronaSummary) {
      print("SUMMARY EVENT");
      yield* _mapCoronaSummaryEventToState(event);
    }
  }

  Stream<CoronaSummaryState> _mapCoronaSummaryEventToState(FetchCoronaSummary event) async* {
    yield CoronaSummaryLoading();
    try {
      CoronaSummary coronaSummary = await coronaRepository.fetchCoronaSummary();
      yield CoronaSummaryLoaded(coronaSummary: coronaSummary);
    } catch (e) {
      yield CoronaSummaryLoadFailure(message: e.toString());
    }
  }

  

}
