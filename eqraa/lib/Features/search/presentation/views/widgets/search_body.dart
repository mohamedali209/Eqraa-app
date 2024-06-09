import 'package:eqraa/Features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:eqraa/Features/search/presentation/views/widgets/search_result_list.dart';
import 'package:eqraa/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSearchTextField(),
        SizedBox(
          height: 16,
        ),
        Text(
          'Search Result',
          style: Styles.textStyle18,
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(child: SearchResultListView())
      ],
    );
  }
}
