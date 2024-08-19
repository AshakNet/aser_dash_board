
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/AcommandtionCubit/accomandtion_Cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelDataTable extends StatelessWidget {
  final PageController controller;
  BuildContext context;

  HotelDataTable({super.key, required this.controller,required this.context});

  List<DataRow> _createRows() {
    return List.generate(
      AccomandtionCubit.get(context).allAccomandtionModel!.data!.length,
          (index) => DataRow(
        onSelectChanged: (selected) {
          if (selected != null && selected) {
            AccomandtionCubit.get(context).loadOne( id : AccomandtionCubit.get(context).allAccomandtionModel!.data![index].id.toString());

            controller.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: AccomandtionCubit.get(context).allAccomandtionModel!.data![index].serviceName.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Center(
            child: Text(AccomandtionCubit.get(context).allAccomandtionModel!.data![index].accomodationType.toString(), style: TextStyle(
                fontSize: 14.sp,

                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(93, 102, 121, 1)
            )),
          )),
          DataCell(CustomText(text: AccomandtionCubit.get(context).allAccomandtionModel!.data![index].company.toString(), size: 14.sp,alignment: Alignment.center, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text: "${AccomandtionCubit.get(context).allAccomandtionModel!.data![index].price.toString()}/ Night", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(
              alignment: Alignment.center,
              text: "${AccomandtionCubit.get(context).allAccomandtionModel!.data![index].revenue.toString()} EGP", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text: AccomandtionCubit.get(context).allAccomandtionModel!.data![index].guests.toString(), size: 14.sp,alignment: Alignment.center, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text:AccomandtionCubit.get(context).allAccomandtionModel!.data![index].additionDate.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(
            CustomText(
                alignment: Alignment.center,
                text: AccomandtionCubit.get(context).allAccomandtionModel!.data![index].status.toString(), size: 14.sp, color: _getStatusColor(index), fontWeight: FontWeight.w400),
          ),
          const DataCell(Icon(Icons.more_vert))
        ],
      ),
    );
  }

  static Color _getStatusColor(int index) {
    switch (index % 4) {
      case 0:
        return orange;
      case 1:
        return Colors.red;
      case 2:
      default:
        return Colors.green;
    }
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: CustomText(text: "Name", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Accommodation Type", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "companyName", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Price", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Revenue", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Guests", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Addition Date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Status", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),

        ],
        rows: _createRows(),
      ),
    );
  }
}
