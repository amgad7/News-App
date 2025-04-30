import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/screens/repo/home_repo.dart';

import '../../models/NewsDataModel.dart';
import '../../models/SourcesResponse.dart';
import '../../shared/components/constant.dart';
import '../../shared/network/remote/end_points.dart';
import '../../shared/styles/app_string.dart';

class HomeRemoteDs implements HomeRepo {
  @override
  Future<NewsDataModel> getNewsData(String sourceId) async {
    Uri url = Uri.https(Constant.BASE_URL, EndPoints.newsData,
        {AppString.apiKey: Constant.APY_KEY_VALUE, "sources": sourceId});
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }

  @override
  Future<SourcesResponse> getSources(String categoryID) async {
    Uri url = Uri.https(Constant.BASE_URL, EndPoints.sources,
        {AppString.apiKey: Constant.APY_KEY_VALUE, "category": categoryID});
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
}
