import 'package:eqraa/Features/splash/views/widgets/splash_view_body.dart';
import 'package:eqraa/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }

  void navigate() {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
