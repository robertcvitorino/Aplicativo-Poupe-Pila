import 'package:poupe/app/modules/home/subpages/account/account_bloc.dart';
import 'package:poupe/app/modules/home/home_repository.dart';
import 'package:poupe/app/modules/home/subpages/cart/cart_bloc.dart';
import 'package:poupe/app/modules/home/subpages/favorite/favorite_bloc.dart';
import 'package:poupe/app/modules/home/subpages/search/search_bloc.dart';
import 'package:poupe/app/modules/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:poupe/app/modules/home/home_page.dart';
import 'package:poupe/app/modules/shared/services/custom_dio/custom_dio.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AccountBloc()),
        Bloc((i) => CartBloc()),
        Bloc((i) => FavoriteBloc()),
        Bloc((i) => SearchBloc()),
        Bloc((i) => HomeBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => HomeRepository(i.getDependency<CustomDio>())),
      ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
