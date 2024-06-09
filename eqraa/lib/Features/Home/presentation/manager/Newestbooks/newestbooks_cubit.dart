import 'package:eqraa/Features/Home/data/models/book_model/bookmodel/bookmodel.dart';
import 'package:eqraa/Features/Home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newestbooks_state.dart';

class NewestbooksCubit extends Cubit<NewestbooksState> {
  NewestbooksCubit(this.homeRepo) : super(NewestbooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchnewestbooks() async {
    emit(Newestbooksloading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold(
      (l) {
        emit(Newestbooksfailure(l.errMessage));
      },
      (r) {
        emit(Newestbookssuccess(r));
      },
    );
  }
}
