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

  UserProfile({
    this.points = 10,
    this.themeMode = 'light',
    this.languageCode = 'id',
  }); // Default values
}
