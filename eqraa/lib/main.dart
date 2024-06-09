import 'package:eqraa/Features/Home/data/repos/home_repo_impl.dart';
import 'package:eqraa/Features/Home/presentation/manager/Newestbooks/newestbooks_cubit.dart';
import 'package:eqraa/Features/Home/presentation/manager/featuredbooks/featuredbooks_cubit.dart';
import 'package:eqraa/constants.dart';
import 'package:eqraa/core/utils/app_router.dart';
import 'package:eqraa/core/utils/service_locator.dart';
import 'package:eqraa/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(const Eqraa());
}

class Eqraa extends StatelessWidget {
  const Eqraa({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>()..fetchFeaturedBooks(),
          ),
        ),
        BlocProvider(
          create: (context) => NewestbooksCubit(
            getIt.get<HomeRepoImpl>()..fetchNewsetBooks(),
          ),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      ),
    );
  }
}
