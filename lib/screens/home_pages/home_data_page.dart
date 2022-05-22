import 'package:flutter/material.dart';
import 'package:news/models/comments_model.dart';
import 'package:news/models/news_model.dart';
import 'package:news/service/comments_api.dart';

class HomeDataPage extends StatefulWidget {
  final Article homeData;
  const HomeDataPage({Key? key, required this.homeData}) : super(key: key);

  @override
  _HomeDataPageState createState() => _HomeDataPageState();
}

class _HomeDataPageState extends State<HomeDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Image.network(
              widget.homeData.urlToImage.toString(),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
              child: Text(
            widget.homeData.title.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 70,
            child: Row(children: [
              const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://source.unsplash.com/random'),
                radius: 53,
              ),
              Text(widget.homeData.author.toString())
            ]),
          ),
          Row(
            children: [
              iconText(Icons.chat_bubble_outline, '8 comment'),
              iconText(Icons.favorite_outline, '34 like'),
              iconText(Icons.share, 'Share'),
            ],
          ),
          SizedBox(
            height: 300,
                      width: 300,
            child: FutureBuilder(
                future: CommentsApi.getData(),
                builder: (ctx, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox(
                        height: 140,
                        width: 137,
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ));
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error'));
                  } else {
                    return SizedBox(
                      height: 300,
                      width: 300,
                      child: Text(snapshot.data[0].body.toString()),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  Widget iconText(IconData icon, String text) {
    return Row(
      children: [Icon(icon), Text(text)],
    );
  }
}
