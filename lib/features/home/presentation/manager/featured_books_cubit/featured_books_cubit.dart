import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featureBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featureBooksUseCase;
  Future<void> fetchFeatureBooks()async {
    emit(FeaturedBooksLoading());

    var result = await featureBooksUseCase.call();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
    }, (success) {
      emit(FeaturedBooksSuccess(success));
    });
  }
}
