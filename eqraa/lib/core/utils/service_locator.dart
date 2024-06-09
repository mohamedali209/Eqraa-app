
import 'package:dio/dio.dart';
import 'package:eqraa/Features/Home/data/repos/home_repo_impl.dart';
import 'package:eqraa/core/utils/apiservice.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
}