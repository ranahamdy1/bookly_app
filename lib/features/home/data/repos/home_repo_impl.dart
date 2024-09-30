import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBook() async{
    try {
      var booksList = homeLocalDataSource.fetchFeatureBook();
      if(booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchFeatureBook();
      return right(books);
    }catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDiorError(e));
      }else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsBook() async{
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBook();
      if(books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBook();
      return right(books);
    }catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDiorError(e));
      }else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}