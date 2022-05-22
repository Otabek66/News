import 'package:flutter/material.dart';
import 'package:news/screens/bookmark_page/boockmark_page.dart';

import 'package:news/screens/home_pages/home_page.dart';
import 'package:news/screens/search_page/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin{
  final _myController = PageController(initialPage: 1, keepPage: true);
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children:const [
        HomePage(),
        SearchPage(),
        BookmarkPage()
      ],),
      bottomNavigationBar: tabBar,
    );
  }
  TabBar get tabBar {
    
    return TabBar(
      controller: _tabController,
      tabs: const[
      Tab(icon: Icon(Icons.home,color: Colors.black,),),
      Tab(icon: Icon(Icons.search,color: Colors.black,),),
      Tab(icon: Icon(Icons.settings,color: Colors.black,),),
    ]);
  }
}