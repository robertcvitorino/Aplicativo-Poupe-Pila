import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:poupe/app/modules/home/subpages/favorite/favorite_bloc.dart';
import 'package:poupe/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  FavoriteBloc bloc;

  setUp(() {
    bloc = HomeModule.to.bloc<FavoriteBloc>();
  });

  group('FavoriteBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<FavoriteBloc>());
    });
  });
}
