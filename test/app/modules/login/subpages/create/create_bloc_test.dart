import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:poupe/app/modules/login/subpages/create/create_bloc.dart';
import 'package:poupe/app/modules/login/login_module.dart';

void main() {
  initModule(LoginModule());
  CreateBloc bloc;

  setUp(() {
    bloc = LoginModule.to.bloc<CreateBloc>();
  });

  group('CreateBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<CreateBloc>());
    });
  });
}
