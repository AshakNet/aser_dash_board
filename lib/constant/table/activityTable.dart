
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/activity_cubit/activitycubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityTable extends StatelessWidget {
  final PageController activity;
  BuildContext context;

  ActivityTable({super.key, required this.activity,required this.context});

  List<DataRow> _createRows() {
    return List.generate(
      ActivityCubit.get(context).getActivityModel!.data!.activities.length,
          (index) => DataRow(

        onSelectChanged: (selected) {
          if (selected != null && selected) {

            ActivityCubit.get(context).loadOneActivity(ActivityCubit.get(context).getActivityModel!.data!.activities[index].id.toString());

            activity.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: ActivityCubit.get(context).getActivityModel!.data!.activities[index].name.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text(ActivityCubit.get(context).getActivityModel!.data!.activities[index].companyName.toString(), style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),

          DataCell(Row(
            children: [
              CustomText(text: "${ActivityCubit.get(context).getActivityModel!.data!.activities[index].price.toString()}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
              CustomText(text: "Person/  ", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),

            ],
          )),
          DataCell(Row(
            children: [
              CustomText(text: "${ActivityCubit.get(context).getActivityModel!.data!.activities[index].revenue.toString()} ", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
              CustomText(text: "   EGP   ", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
            ],
          )),
          DataCell(CustomText(text: ActivityCubit.get(context).getActivityModel!.data!.activities[index].additionDate.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400,alignment: Alignment.center,)),

          const DataCell(Icon(Icons.more_vert))


        ],
      ),
    );
  }
  static Color _getStatusColor(int index) {
    switch (index % 3) {
      case 0:
        return Color.fromRGBO(231, 248, 240, 1);
      case 1:
        return Color.fromRGBO(244, 244, 244, 1);

      case 2:
      default:
        return Color.fromRGBO(251, 201, 160, 1);
    }
  }

  static String _getStatusText(int index) {
    switch (index % 3) {
      case 0:
        return 'Active';
      case 1:
        return 'Restricted';

      case 2:
      default:
        return 'Done';
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: CustomText(text: "Name", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Company name", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Price ( Start from)", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Revenue", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Addition date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),


        ],
        rows: _createRows(),
      ),
    );
  }
}
