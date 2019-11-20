import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:poupe/app/modules/home/subpages/search/search_page.dart';

class SearchModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SearchPage();

  static Inject get to => Inject<SearchModule>.of();
}
