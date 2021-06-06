import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityModel {
  String? id;
  String? createBy;
  String? assignedTo;
  String? title;
  String? description;
  String? status;
  String? priority;
  DateTime? createAt;
  DateTime? endAt;

  ActivityModel();

  ActivityModel.withData({
    this.createBy,
    this.assignedTo,
    this.title,
    this.description,
    this.status,
    this.priority,
    this.createAt,
    this.endAt,
  });

  ActivityModel.fromSnap({
    required this.id,
    required this.createBy,
    required this.assignedTo,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.createAt,
    required this.endAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'createBy': createBy,
      'assignedTo': assignedTo,
      'title': title,
      'description': description,
      'status': status,
      'priority': priority,
      'endAt': endAt,
      'createAt': createAt,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel.withData(
      title: map['title'],
      description: map['description'],
      createAt: map['createAt'],
      createBy: map['createBy'],
      assignedTo: map['assignedTo'],
      endAt: map['endAt'],
      priority: map['priority'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromJson(String source) =>
      ActivityModel.fromMap(json.decode(source));

  ActivityModel copyWith({
    String? id,
    String? title,
    String? description,
    String? status,
    String? priority,
    String? createBy,
    String? createTo,
    DateTime? createAt,
    DateTime? endAt,
  }) {
    return ActivityModel.withData(
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      createBy: createBy ?? this.createBy,
      assignedTo: assignedTo ?? this.assignedTo,
      createAt: createAt ?? this.createAt,
      endAt: endAt ?? this.endAt,
    );
  }

  factory ActivityModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return ActivityModel.fromSnap(
      id: snapshot['activityId'],
      title: snapshot['title'],
      description: snapshot['description'],
      priority: snapshot['priority'],
      status: snapshot['status'],
      createBy: snapshot['createBy'],
      assignedTo: snapshot['assignedTo'],
      createAt: snapshot['createAt'],
      endAt: snapshot['endAt'],
    );
  }
}
