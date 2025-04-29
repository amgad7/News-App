abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeGetSourcesLoadingState extends HomeStates {}

class HomeGetSourcesSuccessState extends HomeStates {}

class HomeGetSourcesErrorState extends HomeStates {
  String errorMessage;

  HomeGetSourcesErrorState(this.errorMessage);
}

class HomeGetNewsLoadingState extends HomeStates {}

class HomeGetNewsSuccessState extends HomeStates {}

class HomeGetNewsErrorState extends HomeStates {
  String errorMessage;

  HomeGetNewsErrorState(this.errorMessage);
}
class changeSelectedSourse extends HomeStates{}