
import 'package:eqraa/Features/Home/data/models/book_model/bookmodel/bookmodel.dart';
import 'package:equatable/equatable.dart';




abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;

  const FeaturedBooksFailure(this.errMessage);
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<Bookmodel> books;

  const FeaturedBooksSuccess(this.books);
}
