abstract class LoginState{}
class InitialLoginState extends LoginState{}
class LoadingLoginState extends LoginState{}
class SuccessLoginState extends LoginState{
  final String uId;
  SuccessLoginState(this.uId);
}
class ChangIconState extends LoginState{}
class ErrorLoginState extends LoginState{
  final String errorMessage;
  ErrorLoginState(this.errorMessage);
}
