import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_launcher/core/providers/core_provider.dart';
import 'package:muslim_launcher/core/utils/toast_utils.dart';
import 'package:muslim_launcher/features/home/providers.dart';
import 'package:muslim_launcher/features/quran/providers.dart';

class QuranScreen extends ConsumerWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ayah = ref.watch(randomAyahProvider);
    final audioPlayer = ref.watch(audioPlayerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Baca & Dengar Quran')),
      body: Center(
        child: ayah.when(
          data: (data) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${data.surah.name} : ${data.number}',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 24),
                Text(data.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontFamily: 'Amiri', fontSize: 28),
                    textDirection: TextDirection.rtl),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.volume_up, size: 32),
                      onPressed: () async {
                        await audioPlayer.setUrl(data.audioUrl);
                        audioPlayer.play();
                      },
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(userPointsProvider.notifier).addPoints(1);
                        ToastUtils.showSuccessToast('+1 Poin!');
                        ref.invalidate(randomAyahProvider);
                      },
                      child: const Text('Dapatkan Poin'),
                    )
                  ],
                )
              ],
            ),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (e, s) => const Text('Gagal memuat ayat'),
        ),
      ),
    );
  }
}
