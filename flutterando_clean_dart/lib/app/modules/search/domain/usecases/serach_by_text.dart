import 'package:dartz/dartz.dart';
import 'package:flutterando_clean_dart/app/modules/search/domain/entities/result_search.dart';
import 'package:flutterando_clean_dart/app/modules/search/domain/errors/errors.dart';
import 'package:flutterando_clean_dart/app/modules/search/domain/repositories/search_repository.dart';

abstract class SearchByText {
  Future<Either<SearchFailure, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<SearchFailure, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }

    return repository.search(searchText);
  }
}
