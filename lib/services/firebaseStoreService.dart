import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/config/constants/authConstants.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';
import 'package:task_mgt_app/models/ResponceModel.dart';

class FirebaseSotreServices {
  final firestoreInstance = FirebaseFirestore.instance;
  final UserService userService = Get.find<UserService>();
  final LocalStore _localStore = LocalStore();

  Future<Stream<RegisterUser>> getUserData() async {
    String userid = await _localStore.getUserid();
    return firestoreInstance
        .collection("users")
        .doc(userid)
        .snapshots()
        .map((event) {
      return RegisterUser.fromDocumentSnapshot(event);
    });
  }

  getUserList() {
    return firestoreInstance
        .collection("users")
        .snapshots()
        .map((QuerySnapshot query) {
      List<RegisterUser> retVal = [];
      query.docs.forEach((element) {
        retVal.add(RegisterUser.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future addActivity(ActivityModel activity) async {
    activity.createAt = DateTime.now();
    activity.createBy = userService.user.userId;
    try {
      await firestoreInstance
          .collection("activity")
          .doc()
          .set(activity.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future updateUser(RegisterUser user) async {
    try {
      await firestoreInstance
          .collection("users")
          .doc(user.userId)
          .update(user.toUpdateMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future removeUser(String userId) async {
    try {
      await firestoreInstance.collection("users").doc(userId).update({
        "isAdmin": false,
        "isApproved": false,
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
