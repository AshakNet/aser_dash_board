abstract class HomeState{

}
class HomeInatialState extends HomeState{}
class StartDate extends HomeState{}

class EndStart extends HomeState{}

class ChoseMonthLoaded extends HomeState{}

class ChangeStatusLoaded extends HomeState{}



class PickDateBlocLoading extends HomeState{}
class DeleteImage extends HomeState{}

class PickDateBlocSSuccessfulState extends HomeState{}
class SuccessfulImage extends HomeState{}
class ErrorImage extends HomeState{}

class EndStartChooseYears extends HomeState{}
class StartDateChooseYears extends HomeState{}
class EndStartChooseMonth extends HomeState{}
class StartDateChooseMonth extends HomeState{}
class GetSystemProfitsLoading extends HomeState{}

class GetSystemProfitsByIdSuccessful extends HomeState{}

class ScrollSusccessfulLeft extends HomeState{}
class ChangeReadLoaded extends HomeState{}

class ChangeSussfulLength extends HomeState{}


class ScrollSusccessfulRigth extends HomeState{}

class ScrollSusccessfulError extends HomeState{}



class GetSystemProfitsError extends HomeState{
  final String error;

  GetSystemProfitsError(this.error);
}

///
class GetBlogLoading extends HomeState{}

class GetAllBlogLoadedMore extends HomeState{}


class GetBlogByIdSuccessful extends HomeState{}

class GetBlogError extends HomeState{
  final String error;

  GetBlogError(this.error);
}


class chooseTypeLoading extends HomeState{}
class ChoosesMonthAccomandtionLoaded extends HomeState{}

class chooseTypeLoaded extends HomeState{}
class chooseTypeLoadedEdit extends HomeState{}

///
class GetAllBlogLoading extends HomeState{}

class GetAllBlogSuccessful extends HomeState{}

class GetAllBlogError extends HomeState{
  final String error;

  GetAllBlogError(this.error);
}

class GetOneBlogLoading extends HomeState{}

class GetOneBlogSuccessful extends HomeState{}

class GetOneBlogError extends HomeState{
  final String error;

  GetOneBlogError(this.error);
}

/// add blog
class CreateBlogLoading extends HomeState{}
class CreateBlogSuccessful extends HomeState{}
class CreateBlogError extends HomeState{
  final String error;

  CreateBlogError(this.error);
}

/// update
class EditBlogLoading extends HomeState{}
class EditBlogSuccessful extends HomeState{}
class EditBlogError extends HomeState{
  final String error;

  EditBlogError(this.error);
}

///
class ChangeStatusLoading extends HomeState{}
class ChangeStatusSuccessful extends HomeState{}
class ChangeStatusError extends HomeState{
  final String error;

  ChangeStatusError(this.error);
}

/// Accomandtion

class GetProfitsAccomodationLoading extends HomeState{}
class GetProfitsAccomodationSuccessful extends HomeState{}
class GetProfitsAccomodationError extends HomeState{
  final String error;

  GetProfitsAccomodationError(this.error);
}