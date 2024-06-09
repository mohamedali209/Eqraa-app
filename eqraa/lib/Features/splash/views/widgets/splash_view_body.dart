import 'package:eqraa/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text('Eqraa', style: Styles.maintext.copyWith(fontSize: 70)),
        ),
        const Text('READ BOOKS FOR FREE')
      ],
    );
  }
}
