abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateAdd extends HomeState {
  final int value;
  HomeStateAdd({required this.value});
}

class HomeStateRemove extends HomeState {
  final int value;
  HomeStateRemove({required this.value});
}

class HomeStateCounter extends HomeState {
  final int value;
  HomeStateCounter({required this.value});
}
