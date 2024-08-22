
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/booking/order_cubit/order_cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBookingTable extends StatelessWidget {
  final PageController orderBookingTable;
  BuildContext context;

   OrderBookingTable({super.key, required this.orderBookingTable,required this.context});

  List<DataRow> _createRows() {
    return List.generate(
      OrderCubit.get(context).getAllOrderModel!.data!.bookings!.length,
          (index) => DataRow(

        onSelectChanged: (selected) {
          if (selected != null && selected) {

            OrderCubit.get(context).getOrderDetails(
                OrderCubit.get(context).getAllOrderModel!.data!.bookings![index].id.toString()
            );

            orderBookingTable.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: "${OrderCubit.get(context).getAllOrderModel!.data!.bookings![index].name}", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text("${OrderCubit.get(context).getAllOrderModel!.data!.bookings![index].email}", style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),
          DataCell(Row(
            children: [
              CustomText(text: "${OrderCubit.get(context).getAllOrderModel!.data!.bookings![index].price}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
              CustomText(text: " EGP ", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
            ],
          )),
          DataCell(CustomText(text: "${OrderCubit.get(context).getAllOrderModel!.data!.bookings![index].bookingDate}", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),

          DataCell(
            CustomText(text: "${OrderCubit.get(context).getAllOrderModel!.data!.bookings![index].status}", size: 14.sp, color:
            OrderCubit.get(context).getAllOrderModel!.data!.bookings![index].status == "Pending" ?
            Colors.black :
            OrderCubit.get(context).getAllOrderModel!.data!.bookings![index].status == "Upcoming" ?
            darkGrey :
            OrderCubit.get(context).getAllOrderModel!.data!.bookings![index].status == "Completed" ?
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
