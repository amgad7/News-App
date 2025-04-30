import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/SourcesResponse.dart';

abstract class HomeRepo {
  Future<SourcesResponse> getSources(String categoryID);
  Future<NewsDataModel> getNewsData(String sourceId);
}
