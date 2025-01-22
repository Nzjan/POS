import 'package:dio/dio.dart';
import 'package:fluent_ui/fluent_ui.dart';

class DioService{
  Dio? dio;

  DioService():dio=Dio(BaseOptions(
    baseUrl: "http://82.180.147.87:8080/api/v1/:en",
    headers: {
      "Accept":"application/json"
    }
  )
  );

  void addToken(String token){
    debugPrint("token $token");
    dio!.options.headers={
      "Accept":"application/json",
      "Authorization":token
    };
  }

  Future<Response> getData(String path)async{
    Response response=await dio!.get(path);
    return response;
  }
}