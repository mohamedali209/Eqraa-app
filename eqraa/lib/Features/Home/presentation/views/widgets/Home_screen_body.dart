import 'package:eqraa/Features/Home/presentation/manager/Newestbooks/newestbooks_cubit.dart';
import 'package:eqraa/Features/Home/presentation/views/widgets/best_selleritem.dart';
import 'package:eqraa/Features/Home/presentation/views/widgets/books_item_list.dart';
import 'package:eqraa/Features/Home/presentation/views/widgets/custom_Appbar.dart';
import 'package:eqraa/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomescreenBody extends StatelessWidget {
  const HomescreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CustomAppbar(),
              const BooksitemList(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Newest Books',
                style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: BestsellerList(),
        ),
      ],
    );
  }
}

class BestsellerList extends StatelessWidget {
  const BestsellerList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewestbooksCubit>(context).fetchnewestbooks();
    return BlocBuilder<NewestbooksCubit, NewestbooksState>(
      builder: (context, state) {
        if ((state is Newestbookssuccess)) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Bestselleritem(
                  bookmodel: state.books[index],
                ),
              );
            },
          );
        } else if (state is Newestbooksfailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
