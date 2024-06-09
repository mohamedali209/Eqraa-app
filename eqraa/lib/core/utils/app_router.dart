import 'package:eqraa/Features/Home/presentation/views/Home_screen.dart';
import 'package:eqraa/Features/Home/presentation/views/book_details_screen.dart';
import 'package:eqraa/Features/search/presentation/views/search_view.dart';
import 'package:eqraa/Features/splash/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const Bookdetails(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}
