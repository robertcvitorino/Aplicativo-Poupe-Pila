import 'package:bloc/bloc.dart';

enum FavoriteEvent { increment, decrement }

class FavoriteBloc extends Bloc<FavoriteEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(FavoriteEvent event) async* {
    switch (event) {
      case FavoriteEvent.decrement:
        yield state - 1;
        break;
      case FavoriteEvent.increment:
        yield state + 1;
        break;
    }
  }
}
