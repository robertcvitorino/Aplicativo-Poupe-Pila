import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:poupe/app/modules/home/subpages/cart/cart_bloc.dart';
import 'package:poupe/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  CartBloc bloc;

  setUp(() {
    bloc = HomeModule.to.bloc<CartBloc>();
  });

  group('CartBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<CartBloc>());
    });
  });
}
