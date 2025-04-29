import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/shared/components/constant.dart';
import 'package:news_app/shared/network/remote/end_points.dart';
import 'package:news_app/shared/styles/app_string.dart';

class ApiManager {
  static Future<NewsDataModel> searchArticles(String query) async {
    Uri url = Uri.https(Constant.BASE_URL, EndPoints.newsData, {
      "q": query,
      AppString.apiKey: Constant.APY_KEY_VALUE,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    return NewsDataModel.fromJson(json);
  }
}
