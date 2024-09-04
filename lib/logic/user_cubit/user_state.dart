abstract class UserState {}

class FirstState extends UserState {}
class GetPersonalInformationLoading extends UserState {}
class GetPersonalInformationSuccessful extends UserState {}
class GetPersonalInformationError extends UserState {
  final String error;

  GetPersonalInformationError(this.error);
}


class UpdateInformationLoading extends UserState {}
class UpdateInformationSuccessful extends UserState {}
class UpdateInformationError extends UserState {
  final String error;

  UpdateInformationError(this.error);
}



class GetAllAdminsLoading extends UserState {}
class GetAllAdminsSuccessful extends UserState {}
class GetAllAdminsError extends UserState {
  final String error;

  GetAllAdminsError(this.error);
}


class AddMemberLoading extends UserState {}
class AddMemberLoaded extends UserState {}
class AddMemberError extends UserState {
  final String error;

  AddMemberError(this.error);
}


class ScrollSusccessfulLeft extends UserState {}
class ChangePassword extends UserState {}
class ScrollSusccessfulRigth extends UserState {}