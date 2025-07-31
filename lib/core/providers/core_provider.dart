import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_provider.g.dart';

@Riverpod(keepAlive: true)
Isar isar(Ref ref) {
  throw UnimplementedError('Isar provider must be overridden');
}

@riverpod
Dio dio(Ref ref) {
  return Dio(BaseOptions(
    baseUrl: 'https://api.alquran.cloud',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
}

@riverpod
AudioPlayer audioPlayer(Ref ref) {
  final player = AudioPlayer();
  ref.onDispose(() {
    player.dispose();
  });
  return player;
}
