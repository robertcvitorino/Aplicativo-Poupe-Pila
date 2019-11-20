import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:poupe/app/modules/home/subpages/search/search_bloc.dart';
import 'package:poupe/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  SearchBloc bloc;

  setUp(() {
    bloc = HomeModule.to.bloc<SearchBloc>();
  });

  group('SearchBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<SearchBloc>());
    });
  });
}
