abstract class RegisterState{}
class InitialRegisterState extends RegisterState{}
class LoadingRegisterState extends RegisterState{}
class SuccessRegisterState extends RegisterState{}
class ChangeIconRegisterState extends RegisterState{}
class ChangeAnIconRegisterState extends RegisterState{}
class ErrorRegisterState extends RegisterState{
  final String errorMessage;
  ErrorRegisterState(this.errorMessage);

}
class CreateUserSuccess extends RegisterState{}
class CreateUserError extends RegisterState{
  final String errorCreate;
  CreateUserError(this.errorCreate);
}