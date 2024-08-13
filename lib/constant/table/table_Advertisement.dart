
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/home/home_cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelAccomandtion extends StatelessWidget {
  final PageController controller;
  BuildContext context;


  HotelAccomandtion({super.key, required this.controller,required this.context,});

  List<DataRow> _createRows() {
    return List.generate(
      HomeCubit.get(context).getAllBlogModel!.data!.length,
          (index) => DataRow(
        onSelectChanged: (selected) {
             HomeCubit.get(context).getOneBlog(HomeCubit.get(context).getAllBlogModel!.data![index].id.toString());
             controller.animateToPage(4, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          // }
        },
        cells: [
          DataCell(CustomText(text: "${HomeCubit.get(context).getAllBlogModel!.data![index].category}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text("${HomeCubit.get(context).getAllBlogModel!.data![index].startDate}", style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),
          DataCell(CustomText(text: "${HomeCubit.get(context).getAllBlogModel!.data![index].endDate}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text: "${HomeCubit.get(context).getAllBlogModel!.data![index].additionDate}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),

          DataCell(CustomText(text: "${HomeCubit.get(context).getAllBlogModel!.data![index].addedBy}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(
            Container(
              width: 80.w,
              decoration: BoxDecoration(
                color: _getStatusColor(index),
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 5.h),
              child: CustomText(text: HomeCubit.get(context).getAllBlogModel!.data![index].status.toString(), size: 12.sp, color: black, fontWeight: FontWeight.w400),
            ),
          ),
          DataCell(Icon(Icons.more_vert))
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
        return Color.fromRGBO(160, 185, 251, 1);
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
        return 'interActive';
      case 2:
        return 'Active';
      case 3:
      default:
        return 'interActive';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: CustomText(text: "Ad Type", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Start Date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "End Date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Addition date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Added By", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Status", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
        ],
        rows: _createRows(),
      ),
    );
  }
}
