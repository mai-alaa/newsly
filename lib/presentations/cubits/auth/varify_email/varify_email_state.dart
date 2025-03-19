sealed class VerifyEmailStates {}
class VerifyEmailInitialState extends VerifyEmailStates{}
class VerifyEmailLoadingState extends VerifyEmailStates{}
class VerifyEmailSuccessState extends VerifyEmailStates{}
class VerifyEmailFailureState extends VerifyEmailStates{
  final String message;
  VerifyEmailFailureState(this.message);
}
class EmailVerifiedState extends VerifyEmailStates{}
