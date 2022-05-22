import 'package:dio/dio.dart';
import 'package:news/models/comments_model.dart';

class CommentsApi{
  static Future getData()async{
    Response res = await Dio().get('https://jsonplaceholder.typicode.com/comments');
    return CommentsModel.fromJson(res.data);
  }
}