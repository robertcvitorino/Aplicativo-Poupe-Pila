import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:poupe/app/modules/home/subpages/account/account_bloc.dart';
import 'package:poupe/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  AccountBloc bloc;

  setUp(() {
    bloc = HomeModule.to.bloc<AccountBloc>();
  });

  group('AccountBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<AccountBloc>());
    });
  });
}
