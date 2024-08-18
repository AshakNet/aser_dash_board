import 'package:aser_dash_board/logic/compaines/compaines_state/compaines_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit() : super(HomeInatialState());

  static CompaniesCubit get(context) => BlocProvider.of(context);

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController addtionalDate = TextEditingController();
  String? statusConvert;


  String ? companyServices;

  void changeCompanyServices(value){
    companyServices = value;

    emit(ChoseCompanyServices());
  }
  String? government;
  void changeGovernment(value) {

    government = value;
    emit(ChooseGovernment());
  }

  String? profit;
  void changeProfits(value) {

    profit = value;
    emit(ChooseProfits());
  }
  int change = 0;

  void toggle(int check) {
    change = check;
    emit(changeBackGround());
  }

  List <String> typeTrips = ["Company","individual"] ;

  List <String> statusList = [
    "Pending",
    "UpComing",
    "Complete",
    "Cancelled"
  ];

  String? status;
  void changeStatus(value){
    status = value;

    emit(ChangeStatusLoaded());
  }

  String? choosesMonth;
  void chooseMonthFunction(value) {

    choosesMonth = value;
    emit(EndStartChooseMonth());
  }
  List <String> month = ["January","February","March","April","May","June","July","August","September","October","November","December"];


  void PickDate(
      {context, required TextEditingController controller,required DateTime firstDate,required DateTime lastDate,required DateTime initialDate}) async {
    emit(PickDateBlocLoading());
    DateTime? pickDate = await showDatePicker(
      //selectableDayPredicate: ,
        context: context,

        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);

    if (pickDate != null) {
      controller.text = pickDate.toString().split(" ")[0];
    }
    emit(PickDateBlocSSuccessfulState());
  }


}