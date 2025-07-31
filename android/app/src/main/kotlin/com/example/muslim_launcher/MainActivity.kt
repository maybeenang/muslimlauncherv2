package com.example.muslim_launcher

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivityLaunchConfigs.BackgroundMode.transparent

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        // Mengatur background mode Flutter menjadi transparan
        intent.putExtra("background_mode", transparent.toString())
        super.onCreate(savedInstanceState)
    }
}
