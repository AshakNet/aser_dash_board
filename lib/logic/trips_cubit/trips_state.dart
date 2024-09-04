abstract class TripsState{

}
class HomeInatialState extends TripsState{}
class StartDate extends TripsState{}

class EndStart extends TripsState{}
class changeBackGround extends TripsState{}

class PickDateBlocLoading extends TripsState{}

class PickDateBlocSSuccessfulState extends TripsState{}
class SuccessfulImage extends TripsState{}
class ErrorImage extends TripsState{}

class GetAllTripsLoading extends TripsState{}
class GetAllTripsSuccessful extends TripsState{}
class GetAllTripsError extends TripsState{
  final String error;

  GetAllTripsError(this.error);
}
class ScrollSusccessfulRigth extends TripsState{}
class ScrollSusccessfulLeft extends TripsState{

}
class GetOneTripsError extends TripsState{
  final String error;

  GetOneTripsError(this.error);
}
class GetOneTripsSuccessful extends TripsState{}
class GetOneTripsLoading extends TripsState{

}
class ActiveError extends TripsState{
  final String error;

  ActiveError(this.error);
}
class ActiveSuccessful extends TripsState{}
class ActiveLoading extends TripsState{

}
class DeleteTripsError extends TripsState{
  final String error;

  DeleteTripsError(this.error);
}
class DeleteTripsSuccessful extends TripsState{}
class SelectCompanySuccessful extends TripsState{}
class DeleteTripsLoading extends TripsState{

}
class CreateTripsError extends TripsState{
  final String error;

  CreateTripsError(this.error);
}
class CreateTripsSuccessful extends TripsState{}
class CreateTripsLoading extends TripsState{

}

class GetProfitsTripsError extends TripsState{
  final String error;

  GetProfitsTripsError(this.error);
}
class GetProfitsTripsSuccessful extends TripsState{}
class ChoosesMonthTripsLoaded extends TripsState{}
class GetProfitsTripsLoading extends TripsState{

}class GetInsightSuccessful extends TripsState{}
class GetInsightLoading extends TripsState{}
class GetInsightError extends TripsState{
  final String error;

  GetInsightError(this.error);
}