import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/screens/repo/home_repo.dart';

class HomeLocalDs implements HomeRepo{
  @override
  Future<NewsDataModel> getNewsData(String sourceId) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourcesResponse> getSources(String categoryID) {
    // TODO: implement getSources
    throw UnimplementedError();
  }


}