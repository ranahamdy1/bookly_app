import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context,state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context,state) => const HomeView(),
      ),
      GoRoute(
        path: '/bookDetailsView',
        builder: (context,state) => const BookDetailsView(),
      ),
      GoRoute(
        path: '/searchView',
        builder: (context,state) => const SearchView(),
      ),
    ],
  );
}