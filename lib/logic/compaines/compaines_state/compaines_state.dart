abstract class CompaniesState{

}
class HomeInatialState extends CompaniesState{}


class PickDateBlocLoading extends CompaniesState{}

class PickDateBlocSSuccessfulState extends CompaniesState{}
class SuccessfulImage extends CompaniesState{}
class ErrorImage extends CompaniesState{}
class changeBackGround extends CompaniesState{}
class ChooseGovernment extends CompaniesState{}
class ChooseProfits extends CompaniesState{}


class ChoseCompanyServices extends CompaniesState{}
class SelectApplicationServicesSuccessful extends CompaniesState{}
class ChangeContry extends CompaniesState{}
class ChangeStatusLoaded extends CompaniesState{}

class EndStartChooseMonth extends CompaniesState{}

class GetAllCompanyLoading extends CompaniesState{}
class GetAllCompanySuccessful extends CompaniesState{}

class GetAllCompanyError extends CompaniesState{
  final String error;

  GetAllCompanyError(this.error);
}
class ChangeStatusUnRestrictLoading extends CompaniesState{}
class ChangeStatusUnRestrictSuccessful extends CompaniesState{}
class ChangeStatusDeleteError extends CompaniesState{
  final String error;

  ChangeStatusDeleteError(this.error);
}
class ChangeStatusDeleteSuccessful extends CompaniesState{}
class ChangeStatusDeleteLoading extends CompaniesState{}

class ChangeStatusActiveError extends CompaniesState{
  final String error;

  ChangeStatusActiveError(this.error);
}
class ChangeStatusActiveLoading extends CompaniesState{}
class ChangeStatusActiveSuccessful extends CompaniesState{}

class ChangeStatusUnRestrictError extends CompaniesState{
  final String error;

  ChangeStatusUnRestrictError(this.error);
}



class GetServices extends CompaniesState{}
class GetGovernMent extends CompaniesState{}


class GetCompanyDetailsError extends CompaniesState{
  final String error;

  GetCompanyDetailsError(this.error);
}


class GetCompanyDetailsInsideLoading extends CompaniesState{}
class GetCompanyDetailsInsideSuccessful extends CompaniesState{}


class GetCompanyDetailsInsideError extends CompaniesState{
  final String error;

  GetCompanyDetailsInsideError(this.error);
}
class ChangeStatusRejectedError extends CompaniesState{
  final String error;

  ChangeStatusRejectedError(this.error);
}



class GetCompanyDetailsSuccessful extends CompaniesState{}
class GetCompanyDetailsLoading extends CompaniesState{}





class ScrollSusccessfulLeft extends CompaniesState{}
class ChangeStatusRejectedLoading extends CompaniesState{}
class ChangeStatusRejectedSuccessful extends CompaniesState{}





class ScrollSusccessfulRigth extends CompaniesState{}



