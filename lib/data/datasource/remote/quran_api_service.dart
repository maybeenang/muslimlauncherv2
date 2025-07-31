import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_launcher/core/providers/core_provider.dart';
import 'package:muslim_launcher/data/models/quran_models.dart';

class QuranApiService {
  final Dio _dio;
  QuranApiService(this._dio);

  Future<Ayah> getRandomAyah() async {
    // API alquran.cloud tidak punya endpoint acak, jadi kita simulasikan
    // dengan surah dan ayat acak.
    final response =
        await _dio.get('/v1/ayah/2:255/ar.alafasy'); // Contoh: Ayat Kursi
    return Ayah.fromJson(response.data['data']);
  }
}

final quranApiServiceProvider = Provider<QuranApiService>((ref) {
  return QuranApiService(ref.watch(dioProvider));
});
