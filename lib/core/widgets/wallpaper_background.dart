import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:muslim_launcher/core/providers/wallpaper_provider.dart';
import 'dart:io';

class WallpaperBackground extends ConsumerWidget {
  final Widget child;
  
  const WallpaperBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallpaper = ref.watch(appWallpaperProvider);
    
    return wallpaper.when(
      data: (wallpaperPath) => Stack(
        children: [
          // Background wallpaper
          Positioned.fill(
            child: _buildWallpaper(wallpaperPath),
          ),
          // Content
          child,
        ],
      ),
      loading: () => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2E7D32), Color(0xFFF1F8E9)],
          ),
        ),
        child: child,
      ),
      error: (_, __) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2E7D32), Color(0xFFF1F8E9)],
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildWallpaper(String? wallpaperPath) {
    // Default gradient if no wallpaper
    if (wallpaperPath == null || wallpaperPath.isEmpty) {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2E7D32), Color(0xFFF1F8E9)],
          ),
        ),
      );
    }

    // Asset wallpaper (SVG)
    if (wallpaperPath.startsWith('assets/')) {
      if (wallpaperPath.endsWith('.svg')) {
        return SvgPicture.asset(
          wallpaperPath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        );
      } else {
        return Image.asset(
          wallpaperPath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        );
      }
    }

    // Custom wallpaper from file system
    final file = File(wallpaperPath);
    if (file.existsSync()) {
      return Image.file(
        file,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    // Fallback to default gradient
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2E7D32), Color(0xFFF1F8E9)],
        ),
      ),
    );
  }
}

class WallpaperPreview extends StatelessWidget {
  final String wallpaperPath;
  final bool isSelected;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const WallpaperPreview({
    super.key,
    required this.wallpaperPath,
    this.isSelected = false,
    this.onTap,
    this.width = 120,
    this.height = 160,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected 
                ? Theme.of(context).primaryColor 
                : Colors.grey.withOpacity(0.3),
            width: isSelected ? 3 : 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: _buildPreviewImage(),
        ),
      ),
    );
  }

  Widget _buildPreviewImage() {
    if (wallpaperPath.startsWith('assets/')) {
      if (wallpaperPath.endsWith('.svg')) {
        return SvgPicture.asset(
          wallpaperPath,
          fit: BoxFit.cover,
        );
      } else {
        return Image.asset(
          wallpaperPath,
          fit: BoxFit.cover,
        );
      }
    }

    // Custom wallpaper
    final file = File(wallpaperPath);
    if (file.existsSync()) {
      return Image.file(
        file,
        fit: BoxFit.cover,
      );
    }

    // Fallback
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2E7D32), Color(0xFFF1F8E9)],
        ),
      ),
      child: const Center(
        child: Icon(Icons.broken_image, color: Colors.white),
      ),
    );
  }
}