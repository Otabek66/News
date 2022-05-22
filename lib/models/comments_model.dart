// To parse this JSON data, do
//
//     final commentsModel = commentsModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'comments_model.g.dart';

CommentsModel commentsModelFromJson(String str) => CommentsModel.fromJson(json.decode(str));

@HiveType(typeId: 1)
class CommentsModel {
    CommentsModel({
        this.postId,
        this.id,
        this.name,
        this.email,
        this.body,
    });
    @HiveField(0)
    int? postId;
    @HiveField(1)
    int? id;
    @HiveField(2)
    String? name;
    @HiveField(3)
    String? email;
    @HiveField(4)
    String? body;

    factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    
}
