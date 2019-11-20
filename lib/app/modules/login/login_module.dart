import 'package:poupe/app/modules/login/subpages/create/create_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:poupe/app/modules/login/login_page.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CreateBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<LoginModule>.of();
}
