import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBook();
  List<BookEntity> fetchNewestBook();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatureBook() {
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBook() {
    throw UnimplementedError();
  }
}
