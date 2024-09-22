import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
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
    ],
  );
}