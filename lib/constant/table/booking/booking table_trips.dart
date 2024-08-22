
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/booking/bookingActivityAndTripsCubit/booking_activity_andtrips.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingTableTrips extends StatelessWidget {
  final PageController bookingTriple;
  BuildContext context;

   BookingTableTrips({super.key, required this.bookingTriple,required this.context});

  List<DataRow> _createRows() {
    return List.generate(
        BookingActivityAndTripsCubit.get(context).getAllTripsBookingModel!.data!.bookings!.length,
          (index) => DataRow(

        onSelectChanged: (selected) {
          if (selected != null && selected) {
            BookingActivityAndTripsCubit.get(context).getBookingDetailsTrips(
                BookingActivityAndTripsCubit.get(context).getAllTripsBookingModel!.data!.bookings![index].id.toString()
            );
            bookingTriple.animateToPage(3, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: "${BookingActivityAndTripsCubit.get(context).getAllTripsBookingModel!.data!.bookings![index].name}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text("${BookingActivityAndTripsCubit.get(context).getAllTripsBookingModel!.data!.bookings![index].email}", style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),
          DataCell(Row(
            children: [
              CustomText(text: "${BookingActivityAndTripsCubit.get(context).getAllTripsBookingModel!.data!.bookings![index].price}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
              CustomText(text: "  EGP  ", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
            ],
          )),
          DataCell(CustomText(text: "${BookingActivityAndTripsCubit.get(context).getAllTripsBookingModel!.data!.bookings![index].bookingDate}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),

          DataCell(
            CustomText(text: "${BookingActivityAndTripsCubit.get(context).getAllTripsBookingModel!.data!.bookings![index].status}", size: 14.sp, color:
            BookingActivityAndTripsCubit.get(context).getAllTripsBookingModel!.data!.bookings![index].status == "Pending" ?
            Colors.black :
            BookingActivityAndTripsCubit.get(context).getAllTripsBookingModel!.data!.bookings![index].status == "Upcoming" ?
            darkGrey :
            BookingActivityAndTripsCubit.get(context).getAllTripsBookingModel!.data!.bookings![index].status == "Completed" ?
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
          DataColumn(label: CustomText(text: "Price", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Order date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Status", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),


        ],
        rows: _createRows(),
      ),
    );
  }
}
