import 'package:dartz/dartz.dart';
import 'package:eqraa/Features/Home/data/models/book_model/bookmodel/bookmodel.dart';
import 'package:eqraa/core/errors/failure.dart';

abstract class HomeRepo {
   Future<Either<Failure, List<Bookmodel>>> fetchNewsetBooks();
  Future<Either<Failure, List<Bookmodel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<Bookmodel>>> fetchSimilarBooks( {required String category});
}
