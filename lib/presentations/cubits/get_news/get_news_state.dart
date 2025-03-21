sealed class GetNewsStates {}
class GetNewsInitilState extends GetNewsStates {}
class GetNewsLoadingState extends GetNewsStates{}
class GetNewsSuccessState extends GetNewsStates{}
class GetNewsFailureState extends GetNewsStates{
  final String error;
  GetNewsFailureState(this.error);
}


