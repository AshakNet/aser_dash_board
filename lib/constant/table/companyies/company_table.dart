
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/compaines/compines_cubit/companies_Cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompainesTable extends StatelessWidget {
  final PageController companyDetails;
  BuildContext context;

   CompainesTable({super.key, required this.companyDetails,required this.context});

  List<DataRow> _createRows() {
    return List.generate(
      CompaniesCubit.get(context).getAllCompanyModel!.data!.length,
          (index) => DataRow(

        onSelectChanged: (selected) {
          if (selected != null && selected) {
            CompaniesCubit.get(context).loadOne(CompaniesCubit.get(context).getAllCompanyModel!.data![index].id.toString());
            companyDetails.animateToPage(1, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: CompaniesCubit.get(context).getAllCompanyModel!.data![index].name.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text(CompaniesCubit.get(context).getAllCompanyModel!.data![index].serviceType.toString(), style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),
          DataCell(CustomText(text: CompaniesCubit.get(context).getAllCompanyModel!.data![index].governate.toString(), size: 14.sp,alignment: Alignment.center, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Row(
            children: [
              CustomText(text: CompaniesCubit.get(context).getAllCompanyModel!.data![index].servicesNo.toString(), size: 14.sp,alignment: Alignment.center, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
              CustomText(text: "  services ", size: 14.sp,alignment: Alignment.center, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
            ],
          )),
          DataCell(Row(
            children: [
              CustomText(text: CompaniesCubit.get(context).getAllCompanyModel!.data![index].profits.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
              CustomText(text: " EGP ", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
            ],
          )),
          DataCell(CustomText(text: CompaniesCubit.get(context).getAllCompanyModel!.data![index].additionalDate.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),


          DataCell(
            CustomText(text: CompaniesCubit.get(context).getAllCompanyModel!.data![index].status.toString(), size: 14.sp, color:


            CompaniesCubit.get(context).getAllCompanyModel!.data![index].status == "Active" ? Colors.green  :
            CompaniesCubit.get(context).getAllCompanyModel!.data![index].status == "Restricted" ? Colors.grey :
            CompaniesCubit.get(context).getAllCompanyModel!.data![index].status == "Deleted" ? Colors.red :
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
          DataColumn(label: CustomText(text: "Service Type", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Governate", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Service Number", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Profits", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Addition date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Status", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),




        ],
        rows: _createRows(),
      ),
    );
  }
}
