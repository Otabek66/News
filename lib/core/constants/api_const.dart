import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstApi{

  static String myApiKey= dotenv.env["MY_API_KEY"]!;
  static String myApi = "https://newsapi.org/v2/everything?q=tesla&from=2022-01-28&sortBy=publishedAt&apiKey=$myApiKey";
}