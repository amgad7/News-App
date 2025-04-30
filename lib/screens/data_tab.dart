import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/bloc/cubit.dart';
import 'package:news_app/screens/bloc/states.dart';
import 'package:news_app/screens/news_tab.dart';
import 'package:news_app/screens/repo/local_dto.dart';
import 'package:news_app/screens/repo/remote_dto.dart';

import '../shared/network/remote/api_manager.dart';

class DataTab extends StatelessWidget {
  String categoryId;
  DataTab({required this.categoryId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRemoteDs())..getSources(categoryId),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(child: CircularProgressIndicator()),
                );
              },
            );
          } else if (state is HomeGetSourcesSuccessState ||
              state is changeSelectedSourse) {
            HomeCubit.get(context).getNewsData();
          }
        },
        builder: (context, state) {
          return NewsTab();
        },
      ),
    );
    // return FutureBuilder(
    //   future: ApiManager.getSources(categoryId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError) {
    //       return Center(child: Text("something went wrong"));
    //     }
    //     var SourcesList = snapshot.data?.sources ?? [];
    //     return NewsTab(sources: SourcesList);
    //   },
    // );
  }
}
