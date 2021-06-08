import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/config/constants/authConstants.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';

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

  Future setActivity(ActivityModel activity) async {
    activity.createAt = DateTime.now();
    activity.createBy = userService.user.userId;
    bool isNew = (activity.id == null) ? true : false;

    try {
      DocumentReference ref =
          firestoreInstance.collection("activity").doc(activity.id);
      activity.id = ref.id;
      await ref.set(activity.toMap(), SetOptions(merge: true)).then((value) {
        if (isNew) {
          firestoreInstance
              .collection("users")
              .doc(activity.assignedTo)
              .update({"taskAssigned": FieldValue.increment(1)});
        }
      });
      return true;
    } catch (e) {
      print(e.toString());
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
        "isRemoved": true,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  getActivityList() {
    return firestoreInstance
        .collection("activity")
        .snapshots()
        .map((QuerySnapshot query) {
      List<ActivityModel> retVal = [];
      query.docs.forEach((docSnap) async {
        retVal.add(ActivityModel.fromDocumentSnapshot(docSnap));
      });
      return retVal;
    });
  }

  Future deleteActivity(ActivityModel activity) async {
    try {
      await firestoreInstance
          .collection("activity")
          .doc(activity.id)
          .delete()
          .then((value) {
        firestoreInstance
            .collection("users")
            .doc(activity.assignedTo)
            .update({"taskAssigned": FieldValue.increment(-1)});
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future updateState(String activityId, String status) async {
    try {
      await firestoreInstance
          .collection("activity")
          .doc(activityId)
          .update({"status": status});
      return true;
    } catch (e) {
      return false;
    }
  }
}
