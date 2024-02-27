import 'package:hive/hive.dart';
part 'user-g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String? email;

  @HiveField(1)
  String? password;

  User({
    this.email,
    this.password,
  });
}

Future<User> getUser() async {
  try {
    if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(UserAdapter());
    var box = await Hive.openBox('register');
    User user = box.isNotEmpty ? await box.getAt(0) : User();
    return user;
  } catch (e) {
    return User();
  }
}

Future<bool> addUser(User user) async {
  try {
    if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(UserAdapter());
    var box = await Hive.openBox('register');
    await box.clear();
    box.add(user);
    return true;
  } catch (e) {
    return false;
  }
}



