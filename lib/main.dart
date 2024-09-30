import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'constants.dart';
import 'features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'features/home/presentation/manager/newest_books/newest_books_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());

  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              HomeRepoImpl(
                  homeLocalDataSource: HomeLocalDataSourceImpl(),
                  homeRemoteDataSource: HomeRemoteDataSourceImpl(ApiService(Dio()))),
            ),
          );
        }
        ),
        BlocProvider(create: (context) {
          return NewestBooksCubit(
            FetchNewestBooksUseCase(
              HomeRepoImpl(
                  homeLocalDataSource: HomeLocalDataSourceImpl(),
                  homeRemoteDataSource: HomeRemoteDataSourceImpl(ApiService(Dio()))),
            ),
          );
        }
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ), // for dark mode
        routerConfig: AppRouter.router,
      ),
    );
  }
}
