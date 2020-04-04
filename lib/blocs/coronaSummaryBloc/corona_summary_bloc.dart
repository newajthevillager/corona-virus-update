import 'package:bloc/bloc.dart';
import 'package:corona_live/blocs/coronaSummaryBloc/corona_summary_event.dart';
import 'package:corona_live/blocs/coronaSummaryBloc/corona_summary_state.dart';
import 'package:corona_live/data/models/corona_summary.dart';
import 'package:corona_live/data/repositories/corona_repository.dart';
import 'package:meta/meta.dart';

class CoronaBloc extends Bloc<CoronaSummaryEvent, CoronaSummaryState> {
  CoronaRepository coronaRepository;

  CoronaBloc({@required this.coronaRepository});

  @override
  // TODO: implement initialState
  CoronaSummaryState get initialState => CoronaSummaryInitial();

  @override
  Stream<CoronaSummaryState> mapEventToState(CoronaSummaryEvent event) async* {
    if (event is CoronaSummaryEvent) {
      yield* mapCoronaSummaryEventToState(event);
    }
  }

  Stream<CoronaSummaryState> mapCoronaSummaryEventToState(
      FetchCoronaSummary event) async* {
    yield CoronaSummaryLoadingState();

    try {
      CoronaSummary coronaSummary = await coronaRepository.fetchCoronaSummary();
      yield CoronaSummaryLoaded(coronaSummary: coronaSummary);
    } catch (e) {
      yield CoronaSummaryFailure(message: e.toString());
    }
  }
}
