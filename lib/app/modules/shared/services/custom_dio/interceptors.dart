import 'package:dio/dio.dart';

class CustomIntecetors extends InterceptorsWrapper{

  @override
  Future onRequest(RequestOptions options) {
    
    print('REQUEST [${options.method}] => PATH${options.path}');

    return super.onRequest(options);
  }
  @override
  Future onResponse(Response response) {

     print('RESPONSE [${response.statusCode}] => PATH${response.request.path}');

    return super.onResponse(response);
  }
  @override
  Future onError(DioError err) {

    print('RESPONSE [${err.response.statusCode}] => PATH${err.request.path}');
    
    return super.onError(err);
  }


}