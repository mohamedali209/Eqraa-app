import 'package:eqraa/Features/Home/presentation/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class Bookdetails extends StatelessWidget {
  const Bookdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Bookdetailsbody(),
      ),
    );
  }
}
