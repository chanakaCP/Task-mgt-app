import 'package:task_mgt_app/config/storage/storage.dart';

class AuthConst {
  Future<void> storeUserid(String accessToken) async {
    await Storage().setValue("id", accessToken);
  }

  Future<String> getUserid() async {
    String? id = await Storage().getValue("id");

    if (id != null)
      return id;
    else
      return "";
  }

  Future<void> storeUser(String data) async {
    await Storage().setValue("user", data);
  }

  Future<String> getUser() async {
    String? user = await Storage().getValue("user");

    if (user != null)
      return user;
    else
      return "";
  }

  clearUserdata() {
    Storage().deleteValue("user");
    Storage().deleteValue("id");
  }
}
