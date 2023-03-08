import "package:dio/dio.dart";

Dio getDioInstance() {
  Dio dio = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com"));

  return dio;
}
