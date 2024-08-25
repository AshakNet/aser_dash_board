
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/user_cubit/user_cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeTable extends StatelessWidget {
   PageController employeeTable = PageController();
   BuildContext context;

   EmployeeTable({super.key, required this.employeeTable,required this.context});

  List<DataRow> _createRows() {
    return List.generate(
      UserCubit.get(context).getAllAdminModel!.data!.adminsData!.length,
          (index) => DataRow(

        onSelectChanged: (selected) {
          if (selected != null && selected) {
            // employeeTable.animateToPage(1, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: "${UserCubit.get(context).getAllAdminModel?.data?.adminsData![index].name.toString()}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text("${UserCubit.get(context).getAllAdminModel?.data?.adminsData![index].email.toString()}", style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),
          DataCell(CustomText(text: "${UserCubit.get(context).getAllAdminModel?.data?.adminsData![index].phone.toString()}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text: "${UserCubit.get(context).getAllAdminModel?.data?.adminsData![index].additionalDate.toString()}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),



          DataCell(
            CustomText(text: "${UserCubit.get(context).getAllAdminModel?.data?.adminsData![index].status.toString()}", size: 14.sp, color:
            UserCubit.get(context).getAllAdminModel?.data?.adminsData![index].status == "Active" ?
                Colors.green :
                Colors.red
                , fontWeight: FontWeight.w400),
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
          DataColumn(label: CustomText(text: "Phone number", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Addition date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Status", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),




        ],
        rows: _createRows(),
      ),
    );
  }
}
