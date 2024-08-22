abstract class BookingActivityState{

}
class HomeInatialState extends BookingActivityState{}


class PickDateBlocLoading extends BookingActivityState{}

class PickDateBlocSSuccessfulState extends BookingActivityState{}
class SuccessfulImage extends BookingActivityState{}
class ErrorImage extends BookingActivityState{}
class changeBackGround extends BookingActivityState{}
class ChoseTypeTripsLoadded extends BookingActivityState{}
class ChangeStatusLoaded extends BookingActivityState{}
class GetAllBookingActivityLoading extends BookingActivityState{}
class GetAllBookingActivitySuccessful extends BookingActivityState{}
class GetAllBookingActivityError extends BookingActivityState{
  final String error;

  GetAllBookingActivityError(this.error);
}

class GetAllBookingTripsLoading extends BookingActivityState{}
class GetAllBookingTripsSuccessful extends BookingActivityState{}
class GetAllBookingTripsError extends BookingActivityState{
  final String error;

  GetAllBookingTripsError(this.error);
}


class GetBookingActivityDetailsLoading extends BookingActivityState{}
class GetBookingActivityDetailsSuccessful extends BookingActivityState{}
class GetBookingActivityDetailsError extends BookingActivityState{
  final String error;

  GetBookingActivityDetailsError(this.error);
}



class GetBookingTripsDetailsLoading extends BookingActivityState{}
class GetBookingTripsDetailsSuccessful extends BookingActivityState{}
class GetBookingTripsDetailsError extends BookingActivityState{
  final String error;

  GetBookingTripsDetailsError(this.error);
}



class AcceptBookingLoading extends BookingActivityState{}
class AcceptBookingSuccessful extends BookingActivityState{}
class AcceptBookingError extends BookingActivityState{
  final String error;

  AcceptBookingError(this.error);
}


class CancelBookingLoading extends BookingActivityState{}
class CancelBookingSuccessful extends BookingActivityState{}
class CancelBookingError extends BookingActivityState{
  final String error;

  CancelBookingError(this.error);
}

class ScrollSusccessfulRigthActivity extends BookingActivityState{}
class ScrollSusccessfulLeftActivity extends BookingActivityState{}


class ScrollSusccessfulRigthTrips extends BookingActivityState{}
class ScrollSusccessfulLeftTrips extends BookingActivityState{}

