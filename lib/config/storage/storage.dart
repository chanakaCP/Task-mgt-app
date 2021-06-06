import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final storage = new FlutterSecureStorage();

  Future<String?> getValue(key) async {
    return await storage.read(key: key);
  }

  Future<bool> setValue(key, value) async {
    await storage.write(key: key, value: value);
    return true;
  }

  Future<bool> deleteValue(key) async {
    await storage.delete(key: key);
    return true;
  }
}
