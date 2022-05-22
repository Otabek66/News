import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:news/screens/home_pages/home_data_page.dart';
import 'package:news/service/news_apple_api_service.dart';
import 'package:news/widgets/bold_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color labelColor = Colors.grey;
  int currentindex = 0;
  List category = ["Apple", "Tesla"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 146, right: 146, bottom: 20),
              width: 99,
              height: 24,
              child: const Image(
                image: AssetImage('assets/images/title.png'),
              ),
            ),
            SizedBox(
              height: 30,
              child: ListView.builder(
                itemCount: category.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, ind) {
                    return Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(30)),
                      height: 28,
                      child: InkWell(
                        child: Chip(
                          backgroundColor: ind == currentindex ? Colors.grey : Colors.yellow ,
                          label: Text(category[ind]),
                          
                        ),
                        onTap: (){
                          setState(() {
                            currentindex = ind;
                            }
                          );
                        },
                      ),
                    );
                  }),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.798,
              child: FutureBuilder(
                  future: Future.wait([NewsApi.getData(),]),
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
                      return
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (ctx, ind) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, "homedata" ,arguments: snapshot.data[0]!.articles![ind]);
                                    },
                                    child: Container(
                                      
                                      height: 150,
                                      margin: const EdgeInsets.only(
                                          bottom: 37, left: 16, right: 16, top: 20),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 140,
                                                width: 137,
                                                child: Image(
                                                  image: NetworkImage(snapshot
                                                          .data[0]!
                                                          .articles![ind]
                                                          .urlToImage ??
                                                      'https://images.unsplash.com/photo-1599420186946-7b6fb4e297f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        width: 211,
                                                        child: Text(
                                                          snapshot.data[0]!
                                                              .articles![ind].title
                                                              .toString(),
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          maxLines: 4,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        )),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                        "By  ${snapshot.data[0]!.articles![ind].author ?? "Apple"}",
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 14),
                                                    Row(
                                                      children:  [
                                                        Text(
                                                          'Entertainment',
                                                          style: MyBoldText.boldtext(color: Colors.blue),
                                                        ),
                                                        const Icon(Icons
                                                            .fiber_manual_record,)
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey,
                                    width: 358,
                                    height: 1,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
