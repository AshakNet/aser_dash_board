
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/booking/bookingActivityAndTripsCubit/booking_activity_andtrips.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingTableActivity extends StatelessWidget {
  final PageController bookingTriple;
  BuildContext context;

   BookingTableActivity({super.key, required this.bookingTriple,required this.context});

  List<DataRow> _createRows() {
    return List.generate(
      BookingActivityAndTripsCubit.get(context).getAllBookingActivityModel!.data!.bookings!.length,
          (index) => DataRow(

        onSelectChanged: (selected) {
          if (selected != null && selected) {
            BookingActivityAndTripsCubit.get(context).getBookingDetailsActivity(
              BookingActivityAndTripsCubit.get(context).getAllBookingActivityModel!.data!.bookings![index].id.toString()
            );
            bookingTriple.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: "${ BookingActivityAndTripsCubit.get(context).getAllBookingActivityModel!.data!.bookings![index].name}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text("${ BookingActivityAndTripsCubit.get(context).getAllBookingActivityModel!.data!.bookings![index].email}", style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),
          DataCell(Row(
            children: [
              CustomText(text: "${ BookingActivityAndTripsCubit.get(context).getAllBookingActivityModel!.data!.bookings![index].price}", size: 14.sp,alignment: Alignment.center, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
              CustomText(text: " EGP ", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
            ],
          )),
          DataCell(CustomText(text: "${ BookingActivityAndTripsCubit.get(context).getAllBookingActivityModel!.data!.bookings![index].bookingDate}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),

          DataCell(
            CustomText(text: "${ BookingActivityAndTripsCubit.get(context).getAllBookingActivityModel!.data!.bookings![index].status}", size: 14.sp, color:
             BookingActivityAndTripsCubit.get(context).getAllBookingActivityModel!.data!.bookings![index].status == "Pending" ?
                 Colors.black :
             BookingActivityAndTripsCubit.get(context).getAllBookingActivityModel!.data!.bookings![index].status == "Upcoming" ?
                 darkGrey :
             BookingActivityAndTripsCubit.get(context).getAllBookingActivityModel!.data!.bookings![index].status == "Completed" ?
                 Colors.green :
                 Colors.red
                , fontWeight: FontWeight.w400),
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
      case 3:
      default:
        return Color.fromRGBO(251, 201, 160, 1);
    }
  }

  static String _getStatusText(int index) {
    switch (index % 4) {
      case 0:
        return 'Pending';
      case 1:
        return 'Cancelled';

      case 2:
      default:
        return 'Accepted';
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
