import 'package:dio/dio.dart';
import 'package:fluent_ui/fluent_ui.dart';

class DioService{
  Dio? dio;

  DioService():dio=Dio(BaseOptions(
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

  Future<Response> getData(String url)async{
    Response response=await dio!.get(url);
    return response;
  }
}