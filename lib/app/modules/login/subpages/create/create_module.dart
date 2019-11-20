import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:poupe/app/modules/login/subpages/create/create_page.dart';

class CreateModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => CreatePage();

  static Inject get to => Inject<CreateModule>.of();
}
