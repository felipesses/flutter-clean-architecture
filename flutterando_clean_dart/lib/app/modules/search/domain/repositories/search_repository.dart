import 'package:dartz/dartz.dart';
import 'package:flutterando_clean_dart/app/modules/search/domain/entities/result_search.dart';
import 'package:flutterando_clean_dart/app/modules/search/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<SearchFailure, List<ResultSearch>>> search(String searchText);
}
