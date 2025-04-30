import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/screens/bloc/states.dart';
import 'package:news_app/screens/repo/home_repo.dart';

import '../../models/NewsDataModel.dart';
import '../../models/SourcesResponse.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepo repo;

  HomeCubit(this.repo) : super(HomeInitState());
  static HomeCubit get(context) => BlocProvider.of(context);
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
      var sourcesResponse = await repo.getSources(categoryId);
      sources = sourcesResponse.sources ?? [];
      emit(HomeGetSourcesSuccessState());
    } catch (e) {
      emit(HomeGetSourcesErrorState(e.toString()));
    }
  }

  Future<void> getNewsData() async {
    try {
      emit(HomeGetNewsLoadingState());
      var newsDataModel =
          await repo.getNewsData(sources[selectedIndex].id ?? "");
      articles = newsDataModel.articles ?? [];
      emit(HomeGetNewsSuccessState());
    } catch (e) {
      emit(HomeGetNewsErrorState(e.toString()));
    }
  }
}
