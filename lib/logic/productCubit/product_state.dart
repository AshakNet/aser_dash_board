abstract class ProductState{

}
class HomeInatialState extends ProductState{}
class StartDate extends ProductState{}

class EndStart extends ProductState{}

class ChangeSingleRoom extends ProductState{}

class changeBackGround extends ProductState{}
class ChoosesMonthProductLoaded extends ProductState{}
class ScrollSusccessfulRigth extends ProductState{}class GetReviewSuccessful extends ProductState{}
class GetReviewLoading extends ProductState{}
class GetReviewError extends ProductState{
  final String error;

  GetReviewError(this.error);
}
class ScrollSusccessfulLeft extends ProductState{}
class SelectCompanySuccessful extends ProductState{}
class SelectCategorySuccessful extends ProductState{}

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
class AddProductSuccess extends ProductState{}
class AddProductLoading extends ProductState{}
class ImageSuccess extends ProductState{}
class AddServiceImagesChanged extends ProductState{}
class AddProductFailure extends ProductState{
  final String error ;

  AddProductFailure(this.error);
}
class GetCategoryProductLoading extends ProductState{}
class GetCategoryProductSuccessful extends ProductState{}
class GetCategoryProductError extends ProductState{
  final String error ;

  GetCategoryProductError(this.error);
}
class GetProductDetailsError extends ProductState{
  final String error ;

  GetProductDetailsError(this.error);
}
class GetProductDetailsSuccessful extends ProductState{}
class GetProductDetailsLoading extends ProductState{}
class GetProductInsightError extends ProductState{
  final String error ;

  GetProductInsightError(this.error);
}
class GetProductInsightSuccessful extends ProductState{}
class GetProductInsightLoading extends ProductState{}