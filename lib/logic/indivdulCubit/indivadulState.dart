abstract class IndividualState{

}
class HomeInatialState extends IndividualState{}


class PickDateBlocLoading extends IndividualState{}

class PickDateBlocSSuccessfulState extends IndividualState{}
class SuccessfulImage extends IndividualState{}
class ErrorImage extends IndividualState{}
class ChangeTransaction extends IndividualState{}
class changeBackGround extends IndividualState{}
class ChangeGender extends IndividualState{}
class ChoseTypeTripsLoadded extends IndividualState{}
class ChangeStatusLoaded extends IndividualState{}

class GetAllIndividualLoading extends IndividualState{}
class GetAllIndividualSuccessful extends IndividualState{}
class GetAllIndividualError extends IndividualState{
  final String error;

  GetAllIndividualError(this.error);
}


class AcceptIndividualLoading extends IndividualState{}
class AcceptIndividualSuccessful extends IndividualState{}
class AcceptIndividualError extends IndividualState{
  final String error;

  AcceptIndividualError(this.error);
}


class CancelIndividualLoading extends IndividualState{}
class CancelIndividualSuccessful extends IndividualState{}
class CancelIndividualError extends IndividualState{
  final String error;

  CancelIndividualError(this.error);
}


class GetIndividualDetailsLoading extends IndividualState{}
class ScrollSusccessfulLeft extends IndividualState{}
class ScrollSusccessfulRigth extends IndividualState{}
class GetIndividualDetailsSuccessful extends IndividualState{}
class GetIndividualDetailsError extends IndividualState{
  final String error;

  GetIndividualDetailsError(this.error);
}

