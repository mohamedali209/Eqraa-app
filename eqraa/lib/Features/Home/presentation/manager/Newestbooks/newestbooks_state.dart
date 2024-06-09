part of 'newestbooks_cubit.dart';

sealed class NewestbooksState {}

final class NewestbooksInitial extends NewestbooksState {}

class Newestbooksloading extends NewestbooksState {}

class Newestbookssuccess extends NewestbooksState {
  final List<Bookmodel> books;

  Newestbookssuccess(this.books);
}

class Newestbooksfailure extends NewestbooksState {
  final String errMessage;

  Newestbooksfailure(this.errMessage);
}
