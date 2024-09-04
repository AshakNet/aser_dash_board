
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/trips_cubit/tripe_cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelDateTableTriple extends StatelessWidget {
  final PageController triple;
  BuildContext context;

  HotelDateTableTriple({super.key, required this.triple,required this.context});

  List<DataRow> _createRows() {
    return List.generate(
      TripsCubit.get(context).getAllTripsModel!.data!.length,
          (index) => DataRow(

        onSelectChanged: (selected) {
          if (selected != null && selected) {
            TripsCubit.get(context).loadOne(TripsCubit.get(context).getAllTripsModel!.data![index].id.toString());
            triple.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: TripsCubit.get(context).getAllTripsModel!.data![index].name.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text(TripsCubit.get(context).getAllTripsModel!.data![index].companyName.toString(), style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),
          DataCell(CustomText(text: TripsCubit.get(context).getAllTripsModel!.data![index].destination.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text: TripsCubit.get(context).getAllTripsModel!.data![index].tripDate.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text: TripsCubit.get(context).getAllTripsModel!.data![index].totalSeats.toString(),alignment: Alignment.center, size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text: TripsCubit.get(context).getAllTripsModel!.data![index].totalBalance.toString(),alignment: Alignment.center, size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(CustomText(text: TripsCubit.get(context).getAllTripsModel!.data![index].additionDate.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(
            CustomText(text: TripsCubit.get(context).getAllTripsModel!.data![index].isActive == true ? "Active" : "InActive",  size: 14.sp, color:
            TripsCubit.get(context).getAllTripsModel!.data![index].isActive == true ? Colors.green : Colors.red
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
          DataColumn(label: CustomText(text: "Company", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Destination", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Trip Date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Total seats", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Total balance", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Addition date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Status", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),


        ],
        rows: _createRows(),
      ),
    );
  }
}
