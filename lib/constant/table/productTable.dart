
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/productCubit/products_cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTable extends StatelessWidget {
  final PageController triple;
  BuildContext context;

  ProductTable({super.key, required this.triple,required this.context});

  List<DataRow> _createRows() {
    return List.generate(
      ProductCubit.get(context).getAllProductsModel!.data!.length,
          (index) => DataRow(

        onSelectChanged: (selected) {
          if (selected != null && selected) {
            triple.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          }
        },
        cells: [
          DataCell(CustomText(text: ProductCubit.get(context).getAllProductsModel!.data![index].productName.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Text(ProductCubit.get(context).getAllProductsModel!.data![index].companyName.toString(), style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(93, 102, 121, 1)
          ))),
          DataCell(CustomText(text: ProductCubit.get(context).getAllProductsModel!.data![index].craftType.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),
          DataCell(Row(
            children: [
              CustomText(text: ProductCubit.get(context).getAllProductsModel!.data![index].price.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),
              CustomText(text: "EGP/Piece", size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400),

            ],
          )),
          DataCell(CustomText(text:ProductCubit.get(context).getAllProductsModel!.data![index].availablePieces.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400,alignment: Alignment.center,)),
          DataCell(CustomText(text: ProductCubit.get(context).getAllProductsModel!.data![index].additionDate.toString(), size: 14.sp, color: Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w400)),


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
          DataColumn(label: CustomText(text: "Company name", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Craft type", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Price", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Available number", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "Addition date", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),
          DataColumn(label: CustomText(text: "", size: 14.sp, color: const Color.fromRGBO(93, 102, 121, 1), fontWeight: FontWeight.w700)),


        ],
        rows: _createRows(),
      ),
    );
  }
}
