
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompainesTable extends StatelessWidget {
  final PageController companyDetails;

   CompainesTable({super.key, required this.companyDetails});

  List<DataRow> _createRows() {
    return List.generate(
      12,
          (index) => DataRow(

        onSelectChanged: (selected) {
          if (selected != null && selected) {
            companyDetails.animateToPage(1, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: "Moataz Elrawy ", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text("Accommodation", style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),
          DataCell(CustomText(text: "Cairo", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text: "3 services", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text: "500000 EGP", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
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
    switch (index % 4) {
      case 0:
        return Color.fromRGBO(231, 248, 240, 1);
      case 1:
        return Color.fromRGBO(244, 244, 244, 1);
      case 2:
        return Color.fromRGBO(244, 244, 244, 1);
      case 3:
      default:
        return Color.fromRGBO(251, 201, 160, 1);
    }
  }

  static String _getStatusText(int index) {
    switch (index % 4) {
      case 0:
        return 'Active';
      case 1:
        return 'Pending';
      case 2:
        return 'Restricted';

      case 3:
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
