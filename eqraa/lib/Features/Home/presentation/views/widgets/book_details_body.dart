import 'package:eqraa/Features/Home/presentation/views/widgets/best_seller_rating.dart';
import 'package:eqraa/Features/Home/presentation/views/widgets/book_item.dart';
import 'package:eqraa/Features/Home/presentation/views/widgets/books_action.dart';
import 'package:eqraa/Features/Home/presentation/views/widgets/custom_details_appbar.dart';
import 'package:eqraa/core/utils/styles.dart';
import 'package:flutter/material.dart';

class Bookdetailsbody extends StatelessWidget {
  const Bookdetailsbody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomdetailAPPbar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .15),
            child:  BookItem(
              imageurl: 'saassa',
            ),
          ),
          Text(
            'The Jungle Book',
            style: Styles.textStyle30.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Opacity(
            opacity: .7,
            child: Text(
              'Rudyard Kipling',
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const BookRating(
            count: 5,
            rating: 5,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const BooksAction()
        ],
      ),
    );
  }
}
