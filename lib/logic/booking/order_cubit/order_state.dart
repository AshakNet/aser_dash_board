abstract class OrderState{

}
class HomeInatialState extends OrderState{}


class PickDateBlocLoading extends OrderState{}

class PickDateBlocSSuccessfulState extends OrderState{}
class SuccessfulImage extends OrderState{}
class ErrorImage extends OrderState{}
class changeBackGround extends OrderState{}
class ChoseTypeTripsLoadded extends OrderState{}
class ChangeStatusLoaded extends OrderState{}

class GetAllOrderLoading extends OrderState{}
class GetAllOrderSuccessful extends OrderState{}
class GetAllOrderError extends OrderState{
  final String error;

  GetAllOrderError(this.error);
}


class AcceptOrderLoading extends OrderState{}
class AcceptOrderSuccessful extends OrderState{}
class AcceptOrderError extends OrderState{
  final String error;

  AcceptOrderError(this.error);
}


class CancelOrderLoading extends OrderState{}
class CancelOrderSuccessful extends OrderState{}
class CancelOrderError extends OrderState{
  final String error;

  CancelOrderError(this.error);
}


class GetOrderDetailsLoading extends OrderState{}
class GetOrderDetailsSuccessful extends OrderState{}
class GetOrderDetailsError extends OrderState{
  final String error;

  GetOrderDetailsError(this.error);
}

