
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeTable extends StatelessWidget {
   PageController employeeTable = PageController();

   EmployeeTable({super.key, required this.employeeTable});

  List<DataRow> _createRows() {
    return List.generate(
      12,
          (index) => DataRow(

        onSelectChanged: (selected) {
          if (selected != null && selected) {
            // employeeTable.animateToPage(1, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: "Moataz Elrawy ", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text("mo3tzelrawy111@gmail.com", style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),
          DataCell(CustomText(text: "01068622052", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text: "18 Mai , 2024", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),



          DataCell(
            Container(
              width: 80.w,
              decoration: BoxDecoration(
                color: _getStatusColor(index),
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 5.h),
              child: CustomText(text: _getStatusText(index), size: 14.sp, color: black, fontWeight: FontWeight.w400),
            ),
          ),
          const DataCell(Icon(Icons.more_vert))


        ],
      ),
    );
  }

  static Color _getStatusColor(int index) {
    switch (index % 2) {
      case 0:
        return Color.fromRGBO(231, 248, 240, 1);
      case 1:
      default:
        return Color.fromRGBO(251, 201, 160, 1);
    }
  }

  static String _getStatusText(int index) {
    switch (index % 2) {
      case 0:
        return 'Active';
      case 1:
      default:
        return 'Deleted';
    }
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
