import 'package:flutter/material.dart';

import '../shared/network/remote/api_manager.dart';
import '../widget/news_item.dart';

class SearchArticle extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {
      showResults(context);
    }, icon: Icon(Icons.search_outlined))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return  FutureBuilder(
      future:
      ApiManager.searchArticles(query),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Center(child: Text("something went wrong"));
        }
        var articles= snapshot.data?.articles ??[];
        return Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return NewsItem(article:  articles[index]);
          },itemCount: articles.length,),
        );
      },);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return  FutureBuilder(
      future:
      ApiManager.searchArticles(query),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Center(child: Text("something went wrong"));
        }
        var articles= snapshot.data?.articles ??[];
        return Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return NewsItem(article:  articles[index]);
          },itemCount: articles.length,),
        );
      },);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(

      inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
        appBarTheme: AppBarTheme(
      backgroundColor: Colors.green,
      iconTheme: IconThemeData(color: Colors.white54),
      centerTitle: true,
      shape: OutlineInputBorder(

          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(28),
            bottomLeft: Radius.circular(28),
          )),
    ));
  }
}
