import 'package:eqraa/Features/Home/presentation/manager/featuredbooks/featuredbooks_cubit.dart';
import 'package:eqraa/Features/Home/presentation/manager/featuredbooks/featuredbooks_state.dart';
import 'package:eqraa/Features/Home/presentation/views/widgets/book_item.dart';
import 'package:eqraa/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksitemList extends StatelessWidget {
  const BooksitemList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {},
                      child: BookItem(
                          imageurl: state
                              .books[index].volumeInfo.imageLinks?.thumbnail??''),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
