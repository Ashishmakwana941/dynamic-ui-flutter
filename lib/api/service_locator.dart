import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'api_service.dart';
import '../bloc/homepage_bloc.dart'; // Ensure this path is correct

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(
    Dio(BaseOptions(
      baseUrl: 'https://food.56testing.club/Api/Api_customer/',
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('food123:food123'))}',
      },
    )),
  );

  getIt.registerSingleton<ApiService>(ApiService(getIt<Dio>()));

  getIt.registerFactory(() => HomepageBloc(getIt<ApiService>()));
}
