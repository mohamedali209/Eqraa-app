import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eqraa/Features/Home/data/models/book_model/bookmodel/bookmodel.dart';
import 'package:eqraa/Features/Home/data/repos/home_repo.dart';
import 'package:eqraa/core/errors/failure.dart';
import 'package:eqraa/core/utils/apiservice.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Bookmodel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<Bookmodel> books = [];
      for (var item in data['items']) {
        books.add(Bookmodel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Bookmodel>>> fetchNewsetBooks()async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming');
      List<Bookmodel> books = [];
      for (var item in data['items']) {
        try {
          books.add(Bookmodel.fromJson(item));
        } catch (e) {
          books.add(Bookmodel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, List<Bookmodel>>> fetchSimilarBooks(  {required String category})async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
      List<Bookmodel> books = [];
      for (var item in data['items']) {
        try {
          books.add(Bookmodel.fromJson(item));
        } catch (e) {
          books.add(Bookmodel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
