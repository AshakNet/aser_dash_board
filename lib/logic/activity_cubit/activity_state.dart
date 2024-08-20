abstract class ActivityState{

}
class HomeInatialState extends ActivityState{}
class StartDate extends ActivityState{}

class EndStart extends ActivityState{}

class ChangeSingleRoom extends ActivityState{}

class changeBackGround extends ActivityState{}

class PickDateBlocLoading extends ActivityState{}

class PickDateBlocSSuccessfulState extends ActivityState{}
class SuccessfulImage extends ActivityState{}
class ChoosesMonthActivityLoaded extends ActivityState{}
class ErrorImage extends ActivityState{}
class GetAllActivityLoading extends ActivityState{}
class GetAllActivitySuccessful extends ActivityState{}
class ScrollSusccessfulRigth extends ActivityState{}
class ScrollSusccessfulLeft extends ActivityState{}
class SelectCompanySuccessful extends ActivityState{}
class GetAllActivityError extends ActivityState{
  final String error;

  GetAllActivityError(this.error);
}
class CreateActivityLoading extends ActivityState{}
class CreateActivitySuccessful extends ActivityState{}
class CreateActivityError extends ActivityState{
  final String error;

  CreateActivityError(this.error);
}
class GetOneActivityLoading extends ActivityState{}
class GetOneActivitySuccessful extends ActivityState{}
class GetOneActivityError extends ActivityState{
  final String error;

  GetOneActivityError(this.error);
}
class GetReviewLoading extends ActivityState{}
class GetReviewSuccessful extends ActivityState{}
class GetReviewError extends ActivityState{
  final String error;

  GetReviewError(this.error);
}
