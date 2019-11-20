import 'package:dio/dio.dart';
import 'package:poupe/app/modules/shared/services/constants.dart';
import 'package:poupe/app/modules/shared/services/custom_dio/interceptors.dart';

 class CustomDio{
   Dio dio;

   CustomDio(){
     dio.options.baseUrl=BASE_URL_API;
     dio.interceptors.add(CustomIntecetors() );
   }
 
 
 }

  