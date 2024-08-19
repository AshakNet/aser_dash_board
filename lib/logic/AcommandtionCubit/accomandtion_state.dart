abstract class AccomandtionState{

}
class HomeInatialState extends AccomandtionState{}
class StartDate extends AccomandtionState{}

class EndStart extends AccomandtionState{}

class ChoseMonthLoaded extends AccomandtionState{}

class ChangeStatusLoaded extends AccomandtionState{}



class PickDateBlocLoading extends AccomandtionState{}
class DeleteImage extends AccomandtionState{}

class PickDateBlocSSuccessfulState extends AccomandtionState{}
class SuccessfulImage extends AccomandtionState{}
class ErrorImage extends AccomandtionState{}

class EndStartChooseYears extends AccomandtionState{}
class StartDateChooseYears extends AccomandtionState{}
class EndStartChooseMonth extends AccomandtionState{}
class StartDateChooseMonth extends AccomandtionState{}
class GetSystemProfitsLoading extends AccomandtionState{}

class GetSystemProfitsByIdSuccessful extends AccomandtionState{}

class ScrollSusccessfulLeft extends AccomandtionState{}
class ChangeReadLoaded extends AccomandtionState{}

class ChangeSussfulLength extends AccomandtionState{}


class ScrollSusccessfulRigth extends AccomandtionState{}

class ScrollSusccessfulError extends AccomandtionState{}



class GetSystemProfitsError extends AccomandtionState{
  final String error;

  GetSystemProfitsError(this.error);
}

///
class GetBlogLoading extends AccomandtionState{}

class GetAllBlogLoadedMore extends AccomandtionState{}


class GetBlogByIdSuccessful extends AccomandtionState{}

class GetBlogError extends AccomandtionState{
  final String error;

  GetBlogError(this.error);
}


class chooseTypeLoading extends AccomandtionState{}
class ChoosesMonthAccomandtionLoaded extends AccomandtionState{}

class chooseTypeLoaded extends AccomandtionState{}
class chooseTypeLoadedEdit extends AccomandtionState{}

///
class GetAllBlogLoading extends AccomandtionState{}

class GetAllBlogSuccessful extends AccomandtionState{}

class GetAllBlogError extends AccomandtionState{
  final String error;

  GetAllBlogError(this.error);
}

class GetOneAccomandtionLoading extends AccomandtionState{}

class GetOneAccomandtionSuccessful extends AccomandtionState{}

class GetOneAccomandtionError extends AccomandtionState{
  final String error;

  GetOneAccomandtionError(this.error);
}

/// add accomandtion
class GetAllAccomandtionLoading extends AccomandtionState{}
class GetAllAccomandtionSuccessful extends AccomandtionState{}
class GetAllAccomandtionError extends AccomandtionState{
  final String error;

  GetAllAccomandtionError(this.error);
}

/// update
class EditBlogLoading extends AccomandtionState{}
class EditBlogSuccessful extends AccomandtionState{}
class EditBlogError extends AccomandtionState{
  final String error;

  EditBlogError(this.error);
}

///
class ChangeStatusLoading extends AccomandtionState{}
class ChangeStatusSuccessful extends AccomandtionState{}
class ChangeStatusError extends AccomandtionState{
  final String error;

  ChangeStatusError(this.error);
}

class ChangeStatusRejectedLoading extends AccomandtionState{}
class ChangeStatusRejectedSuccessful extends AccomandtionState{}
class ChangeStatusRejectedError extends AccomandtionState{
  final String error;

  ChangeStatusRejectedError(this.error);
}

/// Accomandtion

class GetProfitsAccomodationLoading extends AccomandtionState{}
class GetProfitsAccomodationSuccessful extends AccomandtionState{}
class GetProfitsAccomodationError extends AccomandtionState{
  final String error;

  GetProfitsAccomodationError(this.error);
}
class GetReviewLoading extends AccomandtionState{}
class GetReviewSuccessful extends AccomandtionState{}
class GetReviewError extends AccomandtionState{
  final String error;

  GetReviewError(this.error);
}

class ChangeContry extends AccomandtionState{}
 ///
class GetInsightAccomandtionLoading extends AccomandtionState{}
class GetInsightAccomandtionSuccessful extends AccomandtionState{}
class ChoosesMonthAccomandtionInsightLoaded extends AccomandtionState{}
class changeBackGround extends AccomandtionState{}
class GetInsightAccomandtionError extends AccomandtionState{
  final String error;

  GetInsightAccomandtionError(this.error);
}

