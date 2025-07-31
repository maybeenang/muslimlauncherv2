import 'package:muslim_launcher/data/datasource/remote/quran_api_service.dart';
import 'package:muslim_launcher/data/models/quran_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
Future<Ayah> randomAyah(RandomAyahRef ref) {
  return ref.watch(quranApiServiceProvider).getRandomAyah();
}
