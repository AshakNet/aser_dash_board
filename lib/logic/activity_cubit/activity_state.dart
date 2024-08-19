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
class ErrorImage extends ActivityState{}
class GetAllActivityLoading extends ActivityState{}
class GetAllActivitySuccessful extends ActivityState{}
class GetAllActivityError extends ActivityState{
  final String error;

  GetAllActivityError(this.error);
}
