import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/productTable.dart';
import 'package:aser_dash_board/logic/productCubit/product_state.dart';
import 'package:aser_dash_board/logic/productCubit/products_cubit.dart';

import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Products extends StatelessWidget {
  PageController product = PageController();
   Products({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductState>(
      listener: (context,state){
        if(state is PickDateBlocSSuccessfulState ){
          ProductCubit.get(context).getAllProduct(skip: 0, take: 10);
        }

      },
      builder: (context,state){
        return Scaffold(
          body:


          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 20.w),
                  child: Row(
                    children: [
                      CustomText(text: "Services", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600,),
                      SizedBox(width: 5.w,),
                      CustomText(text: "Products<<", size: 12.sp, color: black, fontWeight: FontWeight.w700)
                    ],
                  ),
                ),

                state is GetProfitsProductLoading ? const Center(child: CircularProgressIndicator()):


                Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(20.r),
                              color: white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "Total properties",
                                        size: 20.sp,
                                        color: blue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          CustomText(
                                            text: ProductCubit.get(context).getProfitProductsModel!.data!.totalProduct.toString(),
                                            size: 20.sp,
                                            color: blue,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          CustomText(
                                            text: " EGP",
                                            size: 20.sp,
                                            color: blue,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        decoration: BoxDecoration(
                                            border:
                                            Border.all(color: darkGrey),
                                            //color: orange,
                                            borderRadius:
                                            BorderRadiusDirectional
                                                .circular(10.r)),
                                        child: DropdownButton(
                                            focusColor: lightGrey,
                                            dropdownColor: white,
                                            icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: orange,
                                                size: 30.sp),
                                            borderRadius:
                                            BorderRadius.circular(10.r),
                                            underline: SizedBox(),
                                            value: ProductCubit.get(context)
                                                .choosesMonthProduct,
                                            hint: CustomText(
                                                text: "Month",
                                                size: 12.sp,
                                                color: darkGrey,
                                                fontWeight:
                                                FontWeight.w600),
                                            items: ProductCubit.get(context)
                                                .month
                                                .map((e) =>
                                                DropdownMenuItem(
                                                  value: e,
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                        right:
                                                        20.w),
                                                    child: CustomText(
                                                        text: e,
                                                        color: orange,
                                                        fontWeight:
                                                        FontWeight
                                                            .w700,
                                                        size: 16.sp),
                                                  ),
                                                ))
                                                .toList(),
                                            onChanged: (val) {
                                              if (val == "January") {
                                                ProductCubit.get(context).fixProduct =
                                                "1";
                                              } else if (val ==
                                                  "February") {
                                                ProductCubit.get(context).fixProduct =
                                                "2";
                                              } else if (val == "March") {
                                                ProductCubit.get(context).fixProduct =
                                                "2";
                                              } else if (val == "April") {
                                                ProductCubit.get(context).fixProduct =
                                                "4";
                                              } else if (val == "May") {
                                                ProductCubit.get(context).fixProduct =
                                                "5";
                                              } else if (val == "June") {
                                                ProductCubit.get(context).fixProduct =
                                                "6";
                                              } else if (val == "July") {
                                                ProductCubit.get(context).fixProduct =
                                                "7";
                                              } else if (val == "August") {
                                                ProductCubit.get(context).fixProduct =
                                                "8";
                                              } else if (val ==
                                                  "September") {
                                                ProductCubit.get(context).fixProduct =
                                                "9";
                                              } else if (val == "October") {
                                                ProductCubit.get(context).fixProduct =
                                                "10";
                                              } else if (val ==
                                                  "November") {
                                                ProductCubit.get(context).fixProduct =
                                                "11";
                                              } else if (val ==
                                                  "December") {
                                                ProductCubit.get(context).fixProduct =
                                                "12";
                                              }
                                              print(ProductCubit.get(context)
                                                  .fixProduct);
                                              ProductCubit.get(context)
                                                  .chooseMonthProduct(val);
                                              ProductCubit.get(context)
                                                  .getProfitsProduct();




                                            }),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    height: 150.h,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) => SizedBox(
                                        width: 20.w,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: ProductCubit.get(context).getProfitProductsModel!.data!.categoryProducts!.length,
                                      itemBuilder: (context, index) {
                                        var items = [
                                          {
                                            "image": "assets/images/home/accom.png",
                                            "title": ProductCubit.get(context).getProfitProductsModel!.data!.categoryProducts![index].category,
                                            "route": "accommodations",
                                            "price": ProductCubit.get(context).getProfitProductsModel!.data!.categoryProducts![index].count,
                                          },
                                          {
                                            "image": "assets/images/home/product.png",
                                            "title": ProductCubit.get(context).getProfitProductsModel!.data!.categoryProducts![index].category,
                                            "route": "product",
                                            "price": ProductCubit.get(context).getProfitProductsModel!.data!.categoryProducts![index].count,
                                          },
                                          {
                                            "image": "assets/images/home/activity.png",
                                            "title": ProductCubit.get(context).getProfitProductsModel!.data!.categoryProducts![index].category,
                                            "route": "activities",
                                            "price": ProductCubit.get(context).getProfitProductsModel!.data!.categoryProducts![index].count,
                                          },
                                          {
                                            "image": "assets/images/home/trips.png",
                                            "title": ProductCubit.get(context).getProfitProductsModel!.data!.categoryProducts![index].category,
                                            "route": "trips",
                                            "price": ProductCubit.get(context).getProfitProductsModel!.data!.categoryProducts![index].count,
                                          },
                                          {
                                            "image": "assets/images/home/trips.png",
                                            "title": ProductCubit.get(context).getProfitProductsModel!.data!.categoryProducts![index].category,
                                            "route": "trips",
                                            "price": ProductCubit.get(context).getProfitProductsModel!.data!.categoryProducts![index].count,
                                          },
                                        ];
                                        return Container(
                                          width: 200.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  20.r),
                                              color:
                                              const Color.fromRGBO(249, 239, 233, 1)),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15.h, horizontal: 10.w),
                                                child: CustomText(
                                                    text: items[index]["title"].toString(),
                                                    size: 12.sp,
                                                    color: darkGrey,
                                                    alignment: Alignment.centerLeft,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15.h, horizontal: 10.w),
                                                child: Row(
                                                  children: [
                                                    CustomText(
                                                        text: items[index]['price'].toString(),
                                                        size: 24.sp,
                                                        color: black,
                                                        fontWeight: FontWeight.w600),
                                                    Spacer(),
                                                    Image.asset(
                                                        items[index]['image'].toString())
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    )   ,

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    CustomText(
                                        text: "Craft Type",
                                        size: 16.sp,
                                        color: black,
                                        alignment: Alignment.centerLeft,
                                        fontWeight: FontWeight.w600),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(

                                      decoration: BoxDecoration(
                                          color: white,
                                          borderRadius: BorderRadiusDirectional.circular(10.r)
                                      ),
                                      child: Padding(

                                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                                        child: SizedBox(
                                          width: 150.w,
                                          child: DropdownButton(
                                              menuMaxHeight: 200.0,

                                              isExpanded: true,
                                              focusColor: white,
                                              dropdownColor: white,

                                              icon: Align(
                                                  alignment: Alignment.center,
                                                  child: Icon(Icons.keyboard_arrow_down,
                                                      color: orange, size: 30.sp)),
                                              borderRadius: BorderRadius.circular(10.r),
                                              underline: SizedBox(),
                                              value: ProductCubit.get(context).craft,
                                              hint: CustomText(text: "Type", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                              items: ProductCubit.get(context).getAllCategoryProduct?.data
                                                  ?.map((e) => DropdownMenuItem(
                                                value: e.name,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 20.w),
                                                  child: CustomText(
                                                    text: e.name.toString(),
                                                    color: orange,
                                                    fontWeight: FontWeight.w700,
                                                    size: 14.sp,
                                                    alignment: Alignment.center,
                                                  ),
                                                ),
                                              ))
                                                  .toList(),
                                              onChanged: (val) {
                                                ProductCubit.get(context)
                                                    .changeCraft(val);
                                                ProductCubit.get(context).getAllProduct(skip: 0, take: 10);
                                              }),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                          Padding(

                            padding:  EdgeInsets.symmetric(vertical: 10.h),
                            child: SizedBox(
                              width: 200.w,

                              child: Column(
                                children: [
                                  CustomText(
                                      text: " Addition Date",
                                      size: 16.sp,
                                      color: black,
                                      fontWeight: FontWeight.w600),
                                  TextFormField(
                                    controller: ProductCubit.get(context).addtionalDate,
                                    maxLines: 1,
                                    readOnly: true,
                                    onTap: (){
                                      ProductCubit.get(context).PickDate(context, ProductCubit.get(context).addtionalDate);
                                    },
                                    validator: (value) {},
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(

                                      filled: true,
                                      fillColor: white,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 13.w,
                                        vertical: 20.h,
                                      ),
                                      constraints: BoxConstraints(
                                        minHeight: 64.h,
                                        minWidth: 372.w,
                                      ),

                                      hintStyle: TextStyle(
                                        fontSize: 16.sp,
                                        color: darkGrey,
                                      ),
                                      hintText: 'Date',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding:  EdgeInsets.only(top: 30.h),
                            child: CustomText(text: "Reset",
                              function: (){
                                ProductCubit.get(context).addtionalDate.clear();
                                ProductCubit.get(context).craft = null;
                                ProductCubit.get(context).getAllProduct(skip: 0, take: 10);
                              },
                              size: 18.sp, color: darkGrey, fontWeight: FontWeight.w400,textDecoration: TextDecoration.underline,),
                          ),


                        ],
                      ),
                    ),

                    SizedBox(height: 20.h,),

                    Padding(

                      padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 30.w),
                      child: SizedBox(


                        child: TextFormField(
                          controller: ProductCubit.get(context).search,
                          maxLines: 1,
                          validator: (value) {},
                          onChanged: (value){
                            ProductCubit.get(context).getAllProduct(skip: 0, take: 10);
                          },
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: darkGrey,
                              ),
                            ),
                            //filled: true,

                            fillColor: Color.fromRGBO(247, 247, 247, 1),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 13.w,
                              vertical: 20.h,
                            ),
                            constraints: BoxConstraints(
                              minHeight: 64.h,
                              minWidth: 372.w,
                            ),

                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: darkGrey,
                            ),
                            hintText: 'search by product name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(color: orange),
                            ),
                          ),
                        ),
                      ),
                    ),


                    state is GetAllProductLoading ? CircularProgressIndicator() :


                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 30.h),
                      child: Container(

                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadiusDirectional.circular(10.r)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 30.w),
                          child: Container(

                            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(10.r),
                              color: white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CustomText(text: "Product", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                                    SizedBox(width: 30.w,),
                                    CustomText(text: "( ${ProductCubit.get(context).getAllProductsModel!.totalCount} Products)", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: (){
                                        product.animateToPage(1, duration: Duration(milliseconds: 20), curve: Curves.easeIn);
                                      },
                                      child: Container(
                                        width: 90.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.r),
                                            color: orange
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                          child: Row(

                                            children: [
                                              Icon(Icons.add,color: white,),
                                              SizedBox(width: 5.w,),

                                              CustomText(text: "Add", size: 16.sp, color: white, fontWeight: FontWeight.w700,alignment: Alignment.center,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )





                                  ],
                                ),
                                SizedBox(height: 20.h),

                                Container(


                                  child: ProductTable(triple: product,context: context,),
                                ),
                                SizedBox(height: 20.h),
                                Row(

                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        ProductCubit.get(context).scrollLeft();


                                      },
                                      child: Container(
                                        width: 109.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusDirectional.circular(10.r),
                                            border: Border.all(
                                                color: Colors.grey.shade500
                                            )
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.keyboard_arrow_left_sharp,color : Colors.grey.shade500,),

                                            CustomText(text: "Previous", size: 14.sp, color: Colors.grey.shade500, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: (){
                                        ProductCubit.get(context).scrollRight();

                                      },
                                      child: Container(
                                        width: 80.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusDirectional.circular(10.r),
                                            border: Border.all(
                                                color: Colors.grey.shade500
                                            )
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,

                                          children: [


                                            CustomText(text: "Next", size: 14.sp, color: Colors.grey.shade500, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                                            Icon(Icons.keyboard_arrow_right,color : Colors.grey.shade500,),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )





                              ],
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                )





              ],
            ),
          ),
        );
      },

    );
  }
}
