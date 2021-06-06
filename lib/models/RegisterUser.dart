import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterUser {
  String? userId;
  String? name;
  String? email;
  String? password;
  String? position;
  String? profileURL;
  DateTime? createAt;
  bool? isApproved;
  bool? isAdmin;
  bool? isRemoved;
  int? taskAssigned;
  int? taskCompleted;

  RegisterUser();

  RegisterUser.withData({
    required this.name,
    required this.email,
    required this.password,
    required this.position,
    required this.profileURL,
    required this.isApproved,
    required this.isAdmin,
    required this.taskAssigned,
    required this.taskCompleted,
    required this.createAt,
  });

  RegisterUser.fromSnap({
    required this.name,
    required this.email,
    required this.position,
    required this.profileURL,
    required this.isApproved,
    required this.isAdmin,
    required this.isRemoved,
    required this.userId,
    required this.taskAssigned,
    required this.taskCompleted,
    required this.createAt,
  });

  RegisterUser.fromSnapToLog({
    required this.isApproved,
    required this.isRemoved,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'position': position,
      'profileURL': profileURL,
      'isApproved': isApproved,
      'isAdmin': isAdmin,
      'taskAssigned': taskAssigned,
      'taskCompleted': taskCompleted,
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return {
      'name': name,
      'position': position,
      // 'profileURL': profileURL,
      'isApproved': isApproved,
      'isAdmin': isAdmin,
    };
  }

  factory RegisterUser.fromMap(Map<String, dynamic> map) {
    return RegisterUser.withData(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      position: map['position'],
      profileURL: map['profileURL'],
      isApproved: map['isApproved'],
      isAdmin: map['isAdmin'],
      taskAssigned: map['taskAssigned'],
      taskCompleted: map['taskCompleted'],
      createAt: map['createAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUser.fromJson(String source) =>
      RegisterUser.fromMap(json.decode(source));

  RegisterUser copyWith({
    String? name,
    String? email,
    String? password,
    String? position,
    String? profileURL,
    bool? isApproved,
    bool? isAdmin,
    int? taskAssigned,
    int? taskCompleted,
    DateTime? createAt,
  }) {
    return RegisterUser.withData(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      position: position ?? this.position,
      profileURL: profileURL ?? this.profileURL,
      isApproved: isApproved ?? this.isApproved,
      isAdmin: isAdmin ?? this.isAdmin,
      createAt: createAt ?? this.createAt,
      taskAssigned: taskAssigned ?? this.taskAssigned,
      taskCompleted: taskCompleted ?? this.taskCompleted,
    );
  }

  factory RegisterUser.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return RegisterUser.fromSnap(
      name: snapshot['name'],
      email: snapshot['email'],
      position: snapshot['position'],
      profileURL: snapshot['profileURL'],
      isApproved: snapshot['isApproved'],
      isRemoved: snapshot['isRemoved'],
      isAdmin: snapshot['isAdmin'],
      createAt: snapshot['createAt'].toDate(),
      userId: snapshot['userId'],
      taskAssigned: snapshot['taskAssigned'],
      taskCompleted: snapshot['taskCompleted'] as int,
    );
  }

  factory RegisterUser.fromDocumentSnapshotToLog(DocumentSnapshot snapshot) {
    return RegisterUser.fromSnapToLog(
      isApproved: snapshot['isApproved'],
      isRemoved: snapshot['isRemoved'],
    );
  }
}
