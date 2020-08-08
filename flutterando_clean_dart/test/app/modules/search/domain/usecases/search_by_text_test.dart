import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando_clean_dart/app/modules/search/domain/entities/result_search.dart';
import 'package:flutterando_clean_dart/app/modules/search/domain/errors/errors.dart';
import 'package:flutterando_clean_dart/app/modules/search/domain/repositories/search_repository.dart';
import 'package:flutterando_clean_dart/app/modules/search/domain/usecases/serach_by_text.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();

  final usecase = SearchByTextImpl(repository);

  test('deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecase("chris smoove");

    // expect(result, isA<Right>());
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('deve retornar um InvalidTextError caso o texto seja inválido',
      () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usecase(null);

    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await usecase("");

    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
