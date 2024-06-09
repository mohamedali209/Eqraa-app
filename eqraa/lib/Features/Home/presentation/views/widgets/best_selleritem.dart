import 'package:eqraa/Features/Home/data/models/book_model/bookmodel/bookmodel.dart';
import 'package:eqraa/Features/Home/presentation/views/widgets/best_seller_rating.dart';
import 'package:eqraa/Features/Home/presentation/views/widgets/book_item.dart';
import 'package:eqraa/core/utils/app_router.dart';
import 'package:eqraa/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Bestselleritem extends StatelessWidget {
  const Bestselleritem({super.key, required this.bookmodel});
  final Bookmodel bookmodel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            BookItem(
                imageurl: bookmodel.volumeInfo.imageLinks?.thumbnail ?? ''),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookmodel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    bookmodel.volumeInfo.authors.toString(),
                    style: Styles.textStyle14.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        r'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: bookmodel.volumeInfo.averageRating ?? 0,
                        count: bookmodel.volumeInfo.ratingsCount ?? 0,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
