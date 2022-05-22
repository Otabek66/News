import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/models/comments_model.dart';
import 'package:news/models/news_model.dart';
import 'package:news/routes/my_routes.dart';

void main() {
  // dotenv.load(fileName: ".env");
  // await Hive.initFlutter();
  // Hive.registerAdapter(CommentsModelAdapter());
  // Hive.registerAdapter(NewsModelAdapter());
  // Hive.registerAdapter(ArticleAdapter());
  // Hive.registerAdapter(SourceAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final MyRoutes _myRoutes = MyRoutes();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      onGenerateRoute: _myRoutes.onGenerate,
      initialRoute: '/',
    );
  }
}

