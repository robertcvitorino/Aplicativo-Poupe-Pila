import 'package:bloc/bloc.dart';

enum SearchEvent { increment, decrement }

class SearchBloc extends Bloc<SearchEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(SearchEvent event) async* {
    switch (event) {
      case SearchEvent.decrement:
        yield state - 1;
        break;
      case SearchEvent.increment:
        yield state + 1;
        break;
    }
  }
}
