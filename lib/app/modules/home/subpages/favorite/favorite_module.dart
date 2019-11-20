import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:poupe/app/modules/home/subpages/favorite/favorite_page.dart';

class FavoriteModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => FavoritePage();

  static Inject get to => Inject<FavoriteModule>.of();
}
