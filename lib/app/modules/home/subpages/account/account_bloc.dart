import 'package:bloc/bloc.dart';

enum AccountEvent { increment, decrement }

class AccountBloc extends Bloc<AccountEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(AccountEvent event) async* {
    switch (event) {
      case AccountEvent.decrement:
        yield state - 1;
        break;
      case AccountEvent.increment:
        yield state + 1;
        break;
    }
  }
}
