import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/models/ResponceModel.dart';
import 'package:task_mgt_app/services/firebaseStoreService.dart';

class DatabaseService extends GetxService {
  final FirebaseSotreServices _service = FirebaseSotreServices();

  Future<ResponceModel> addActivity(ActivityModel activity) async {
    final response = await _service.addActivity(activity);
    print(response.toString());
    return response;
  }
}
