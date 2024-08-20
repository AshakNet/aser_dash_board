abstract class ProductState{

}
class HomeInatialState extends ProductState{}
class StartDate extends ProductState{}

class EndStart extends ProductState{}

class ChangeSingleRoom extends ProductState{}

class changeBackGround extends ProductState{}
class ChoosesMonthProductLoaded extends ProductState{}

class PickDateBlocLoading extends ProductState{}

class PickDateBlocSSuccessfulState extends ProductState{}
class SuccessfulImage extends ProductState{}
class ErrorImage extends ProductState{}
class GetProfitsProductSuccessful extends ProductState{}
class GetProfitsProductLoading extends ProductState{}
class GetProfitsProductError extends ProductState{
  final String error ;

  GetProfitsProductError(this.error);
}
class GetAllProductSuccessful extends ProductState{}
class GetAllProductLoading extends ProductState{}
class GetAllProductError extends ProductState{
  final String error ;

  GetAllProductError(this.error);
}
