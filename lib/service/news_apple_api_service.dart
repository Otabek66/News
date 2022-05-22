import 'package:dio/dio.dart';
import 'package:news/models/news_model.dart';

class NewsApi{
  static Future<NewsModel> getData()async{
    Response res = await Dio().get("https://newsapi.org/v2/everything?q=apple&from=2022-03-08&to=2022-03-08&sortBy=popularity&apiKey=f50f1f2a5a344616abbe1af58cc2d603");
    return NewsModel.fromJson(res.data);
  }

}