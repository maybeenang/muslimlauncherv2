import 'package:isar/isar.dart';

part 'user_profile.g.dart';

@collection
class UserProfile {
  Id id = Isar.autoIncrement;
  int points;
  
  // Theme preference: 'light' or 'dark'
  String themeMode;
  
  // Language preference: 'id' for Indonesian, 'en' for English
  String languageCode;
  
  // Wallpaper path: asset path or file path for custom wallpaper
  String? wallpaperPath;

  UserProfile({
    this.points = 10,
    this.themeMode = 'light',
    this.languageCode = 'id',
    this.wallpaperPath,
  }); // Default values
}
