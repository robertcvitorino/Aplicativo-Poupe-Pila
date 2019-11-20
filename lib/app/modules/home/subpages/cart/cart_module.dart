import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:poupe/app/modules/home/subpages/cart/cart_page.dart';

class CartModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => CartPage();

  static Inject get to => Inject<CartModule>.of();
}
