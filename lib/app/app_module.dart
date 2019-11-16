import 'package:poupe/app/app_widget.dart';
import 'package:poupe/app/modules/login/login_bloc.dart';
import 'package:poupe/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';


class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
      Bloc((i) => AppBloc()),
        Bloc((i) => LoginBloc()),
       
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
