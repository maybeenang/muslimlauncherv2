import 'package:isar/isar.dart';

part 'user_profile.g.dart';

@collection
class UserProfile {
  Id id = Isar.autoIncrement;
  int points;

  UserProfile({this.points = 10}); // Poin awal
}
