sealed class CreateUserStates {}
class CreateUserInitialState extends CreateUserStates{}
class CreateUserLoadingState extends CreateUserStates{}
class CreateUserSuccessState extends CreateUserStates{}
class CreateUserFailureState extends CreateUserStates{
  String message;
  CreateUserFailureState(this.message);

}


