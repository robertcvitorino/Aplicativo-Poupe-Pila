import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:poupe/app/modules/shared/services/custom_dio/custom_dio.dart';

class HomeRepository extends Disposable {

    CustomDio _client;

  HomeRepository(CustomDio dependency);
  /*
  Future<UserModel> getUser(int id) async{
    
    try {
    var response =await _client.dio.get("/cliente/{$id}");
      UserModel userModel;
      userModel.toJson(response.data);

    return ;
  */
  Future<int> createUser(Map<String,dynamic>data)async{
    try {
      var response= await _client.dio.post('/cliente',data:data);

      print(response.realUri.toString());

      return response.statusCode;
    } on DioError catch (err){
        print(err.error.toString());
        throw (err.message);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }  
}



 
