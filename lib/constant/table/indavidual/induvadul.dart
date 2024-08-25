
import 'package:aser_dash_board/logic/indivdulCubit/indivadulCubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndividualTable extends StatelessWidget {
  final PageController individualDetails;
  BuildContext context;

  IndividualTable({super.key, required this.individualDetails,required this.context});

  List<DataRow> _createRows() {
    return List.generate(
      IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData!.length,
          (index) => DataRow(

        onSelectChanged: (selected) {
          if (selected != null && selected) {
            IndividualCubit.get(context).getIndividualDetails(id :IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].id.toString() );
            individualDetails.animateToPage(1, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].name.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text(IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].email.toString(), style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),
          DataCell(CustomText(text: IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].gender.toString(), size: 14.sp,alignment: Alignment.center, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Row(
            children: [
              CustomText(text: IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].transaction.toString(), size: 14.sp,alignment: Alignment.center, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
              CustomText(text: "  bookings ", size: 14.sp,alignment: Alignment.center, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
            ],
          )),
          DataCell(Row(
            children: [
              CustomText(text: IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].totalPayment.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
              CustomText(text: " EGP ", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
            ],
          )),
          //DataCell(CustomText(text: IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].additionalDate.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),

          DataCell(CustomText(text: IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].additionalDate.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),

          DataCell(
            CustomText(text: IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].status.toString(), size: 14.sp, color:


            IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].status == "Active" ? Colors.green  :
            IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].status == "Restricted" ? Colors.grey :
            IndividualCubit.get(context).getAllIndividulsModel!.data!.individualsData![index].status == "Deleted" ? Colors.red :
            Colors.black,


                fontWeight: FontWeight.w400),
          ),
          const DataCell(Icon(Icons.more_vert))


        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: CustomText(text: "Name", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Mail", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Gender", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Transactions", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          // DataColumn(label: CustomText(text: "Services", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Payments", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Addition date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Status", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),




        ],
        rows: _createRows(),
      ),
    );
  }
}
