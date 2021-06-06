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
  final AuthConst _con = AuthConst();

  Future<Stream<RegisterUser>> getUserData() async {
    String userid = await _con.getUserid();
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
        // .orderBy("createAt", descending: true)
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
    ResponceModel responce;
    try {
      await firestoreInstance
          .collection("activity")
          .doc()
          .set(activity.toMap());

      responce = ResponceModel(message: "Success", isSuccess: true);
      return responce;
    } catch (e) {
      responce = ResponceModel(message: "Action failed", isSuccess: false);
      return responce;
    }
  }
}
