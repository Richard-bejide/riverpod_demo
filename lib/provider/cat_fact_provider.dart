import 'package:riverpod_demo/repo/cat_fact_services.dart';
import 'package:riverpod/riverpod.dart';

final catFactProvider = FutureProvider.autoDispose((_) {
  final catFactService = CatFactServices();
  return catFactService.getCatFact();
});
