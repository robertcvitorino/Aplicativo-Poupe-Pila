import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poupe/app/modules/login/login_module.dart';
import 'package:poupe/app/modules/router/routers.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginModule(),
      onGenerateRoute: Router.generateRoute,
        initialRoute: "/",
    navigatorKey: Get.key,
    
    );
  }
}
