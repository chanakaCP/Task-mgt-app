import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterUser {
  String? userId;
  String? name;
  String? email;
  String? password;
  String? position;
  String? profileURL;
  bool? isApproved;
  bool? isAdmin;
  int? taskAssigned;
  int? taskComleted;

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
    required this.taskComleted,
  });

  RegisterUser.fromSnap({
    required this.name,
    required this.email,
    required this.position,
    required this.profileURL,
    required this.isApproved,
    required this.isAdmin,
    required this.userId,
    required this.taskAssigned,
    required this.taskComleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'position': position,
      'profileURL': profileURL,
      'isApproved': isApproved,
      'isAdmin': isAdmin,
      'taskAssigned': taskAssigned,
      'taskComleted': taskComleted,
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
      taskComleted: map['taskComleted'],
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
    int? taskComleted,
  }) {
    return RegisterUser.withData(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      position: position ?? this.position,
      profileURL: profileURL ?? this.profileURL,
      isApproved: isApproved ?? this.isApproved,
      isAdmin: isAdmin ?? this.isAdmin,
      taskAssigned: taskAssigned ?? this.taskAssigned,
      taskComleted: taskComleted ?? this.taskComleted,
    );
  }

  factory RegisterUser.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return RegisterUser.fromSnap(
      name: snapshot['name'],
      email: snapshot['email'],
      position: snapshot['position'],
      profileURL: snapshot['profileURL'],
      isApproved: snapshot['isApproved'],
      isAdmin: snapshot['isAdmin'],
      userId: snapshot['userId'],
      taskAssigned: snapshot['taskAssigned'],
      taskComleted: snapshot['taskComleted'],
    );
  }
}
