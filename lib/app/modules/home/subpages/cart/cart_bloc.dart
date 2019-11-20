import 'package:bloc/bloc.dart';

enum CartEvent { increment, decrement }

class CartBloc extends Bloc<CartEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CartEvent event) async* {
    switch (event) {
      case CartEvent.decrement:
        yield state - 1;
        break;
      case CartEvent.increment:
        yield state + 1;
        break;
    }
  }
}
