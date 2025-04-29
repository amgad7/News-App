import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/screens/bloc/states.dart';

import '../../models/NewsDataModel.dart';
import '../../models/SourcesResponse.dart';
import '../../shared/components/constant.dart';
import '../../shared/network/remote/end_points.dart';
import '../../shared/styles/app_string.dart';

class HomeCubit extends Cubit<HomeStates> {
  static HomeCubit get(context) => BlocProvider.of(context);
  HomeCubit() : super(HomeInitState());
  List<Sources> sources = [];
  List<Articles> articles = [];
  int selectedIndex = 0;

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(changeSelectedSourse());
  }

  Future<void> getSources(String categoryId) async {
    emit(HomeGetSourcesLoadingState());
    try {
      Uri url = Uri.https(Constant.BASE_URL, EndPoints.sources, {
        AppString.apiKey: Constant.APY_KEY_VALUE,
        "category": categoryId
      });
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      sources = sourcesResponse.sources ?? [];
      emit(HomeGetSourcesSuccessState());
    } catch (e) {
      emit(HomeGetSourcesErrorState(e.toString()));
    }
  }

  Future<void> getNewsData() async {
    try {
      emit(HomeGetNewsLoadingState());
      Uri url = Uri.https(Constant.BASE_URL, EndPoints.newsData,
          {AppString.apiKey: Constant.APY_KEY_VALUE, "sources": sources[selectedIndex].id});
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
      articles = newsDataModel.articles ?? [];
      emit(HomeGetNewsSuccessState());
    } catch (e) {
      emit(HomeGetNewsErrorState(e.toString()));
    }
  }
}
