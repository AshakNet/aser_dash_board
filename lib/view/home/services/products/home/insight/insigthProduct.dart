import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/insigth_product.dart';
import 'package:aser_dash_board/logic/productCubit/product_state.dart';
import 'package:aser_dash_board/logic/productCubit/products_cubit.dart';

import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class InsightsProducts extends StatelessWidget {
  PageController insightsProduct = PageController();
  InsightsProducts({super.key,required this.insightsProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductCubit,ProductState>(
        listener: (context,state){},
        builder: (context,state){
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      CustomText(
                          text: "Home",
                          size: 12.sp,
                          color: darkGrey,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        width: 5.w,
                      ),
                      GestureDetector(
                          onTap: () {
                            insightsProduct.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: CustomText(
                              text: "Products<<",
                              size: 12.sp,
                              color: darkGrey,
                              fontWeight: FontWeight.w600)),
                      CustomText(
                          text: "${ProductCubit.get(context).getProductDetailsModel!.data!.productName.toString()}<<",
                          size: 12.sp,
                          color: black,
                          fontWeight: FontWeight.w700),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          insightsProduct.previousPage( duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                          ProductCubit.get(context).toggle(0);


                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color:ProductCubit.get(context).change == 0 ? orange : white,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset(
                                "assets/images/home/services.png",

                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: "Service",
                                size: 14.sp,
                                color: black,
                                fontWeight: FontWeight.w600,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          insightsProduct.animateToPage(4, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                          ProductCubit.get(context).toggle(1);


                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color:  ProductCubit.get(context).change == 1 ? orange : white,

                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset(
                                "assets/images/home/chart.png",
                                color: black,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: "Orders",
                                size: 14.sp,
                                color: black,
                                fontWeight: FontWeight.w600,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          ProductCubit.get(context).toggle(2);


                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color: ProductCubit.get(context).change == 2 ? orange : white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset(
                                "assets/images/home/chart.png",
                                color: black,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: "Insights",
                                size: 14.sp,
                                color: black,
                                fontWeight: FontWeight.w600,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),

                /// left side

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                    children: [
                      Row(
                        children: [

                          Expanded(
                            flex: 70,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadiusDirectional.circular(20.r),
                                      color: white
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white,
                                          borderRadius: BorderRadiusDirectional.circular(20.r)
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                CustomText(text: "Products Management", size: 20.sp, color: black, fontWeight: FontWeight.w600,),

                                              ],
                                            ),
                                            SizedBox(height: 40.h,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Image.asset("assets/images/home/room.png"),
                                                    CustomText(text: ProductCubit.get(context).getProductInsightModel!.data!.management!.totalPieces.toString(), size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                    CustomText(text: "Product", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500)

                                                  ],
                                                ),
                                                SizedBox(width: 80.w,),
                                                Column(
                                                  children: [
                                                    Image.asset("assets/images/home/aval.png"),
                                                    CustomText(text:  ProductCubit.get(context).getProductInsightModel!.data!.management!.sold.toString(), size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                    CustomText(text: "Sold", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500)

                                                  ],
                                                ),
                                                SizedBox(width: 80.w,),
                                                Column(
                                                  children: [
                                                    Image.asset("assets/images/home/aval.png"),
                                                    CustomText(text:  ProductCubit.get(context).getProductInsightModel!.data!.management!.available.toString(), size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                    CustomText(text: "Available", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500)

                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20.w),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadiusDirectional.circular(20.r),
                                      color: white
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white,
                                          borderRadius: BorderRadiusDirectional.circular(20.r)
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                CustomText(text: "Products Revenue", size: 20.sp, color: black, fontWeight: FontWeight.w600,),






                                              ],
                                            ),
                                            SizedBox(height: 40.h,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Image.asset("assets/images/home/room.png"),
                                                    CustomText(text:  ProductCubit.get(context).getProductInsightModel!.data!.revenues!.total.toString(), size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                    CustomText(text: "Total Balance", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500)

                                                  ],
                                                ),
                                                SizedBox(width: 80.w,),
                                                Column(
                                                  children: [
                                                    Image.asset("assets/images/home/aval.png"),
                                                    CustomText(text:  ProductCubit.get(context).getProductInsightModel!.data!.revenues!.paid.toString(), size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                    CustomText(text: "Paid Balance", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500)

                                                  ],
                                                ),
                                                SizedBox(width: 80.w,),
                                                Column(
                                                  children: [
                                                    Image.asset("assets/images/home/aval.png"),
                                                    CustomText(text:  ProductCubit.get(context).getProductInsightModel!.data!.revenues!.pending.toString(), size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                    CustomText(text: "Pending Balance", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500)

                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),


                          SizedBox(width: 40.w,),


                          state is GetReviewLoading ? CircularProgressIndicator():
                          Expanded(
                            flex: 30,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius:
                                  BorderRadiusDirectional.circular(20.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: "Service Reviews",
                                        size: 20.sp,
                                        color: black,
                                        fontWeight: FontWeight.w600),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: "Overall Rating",
                                          size: 16.sp,
                                          color: Color.fromRGBO(53, 71, 100, 1),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        CustomText(
                                          text: "Recommend",
                                          size: 16.sp,
                                          color: Color.fromRGBO(53, 71, 100, 1),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: ProductCubit.get(context).getReviewModel!.data!.totalRate.toString(),
                                          size: 24.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(
                                          width: 85.w,
                                        ),
                                        CustomText(
                                          text: ProductCubit.get(context).getReviewModel!.data!.recomendPercent.toString(),
                                          size: 24.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: ProductCubit.get(context).getReviewModel!.data!.reviewrsCount.toString(),
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        CustomText(
                                          text: "Reviews",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                        ),
                            
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(color: white),
                                      child: SizedBox(
                                        height: 400.h,
                                        child: ListView.builder(
                                            itemCount: ProductCubit.get(context).getReviewModel!.data!.usersReviews.length,
                                            itemBuilder: (context, index) => Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5.h,
                                                  right: 20.w,
                                                  left: 20.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  ListTile(
                                                    contentPadding:
                                                    EdgeInsets.zero,
                                                    leading: const CircleAvatar(
                                                      backgroundImage: AssetImage(
                                                          "assets/images/home/profile.png"),
                                                    ),
                                                    title: Text(
                                                      ProductCubit.get(context).getReviewModel!.data!.usersReviews[index].userName.toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          color: const Color.fromRGBO(
                                                              17, 17, 17, 1),
                                                          fontSize: 14.sp),
                                                    ),
                                                    subtitle: Text(
                                                      ProductCubit.get(context).getReviewModel!.data!.usersReviews[index].time.toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          color: const Color.fromRGBO(
                                                              126, 126, 126, 1),
                                                          fontSize: 12.sp),
                                                    ),
                                                    trailing: SizedBox(
                                                      width: 100.w,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                        children: List.generate(
                                                          ProductCubit.get(context).getReviewModel!.data!.usersReviews[index].rate!.toInt(),
                                                              (index) => Icon(
                                                            Icons.star_rounded,
                                                            color: orange,
                                                            size: 20.r,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    ProductCubit.get(context).getReviewModel!.data!.usersReviews[index].comment.toString(),
                                                    // "Services.contentComment".tr(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        color: const Color.fromRGBO(
                                                            97, 97, 97, 1),
                                                        fontSize: 14.sp),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ) ,


                        ],
                      ),
                      SizedBox(height: 30.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 0.w,vertical: 30.h),
                        child: Container(
                          height: 900.h,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadiusDirectional.circular(10.r)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 30.w),
                            child: Container(

                              padding: EdgeInsets.symmetric(horizontal: 0.w,vertical: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(10.r),
                                color: white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(text: "Bookings", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                                      SizedBox(width: 30.w,),
                                      CustomText(text: "( 200 clients)", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500),




                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Padding(

                                    padding:  EdgeInsets.symmetric(vertical: 10.h),
                                    child: SizedBox(


                                      child: TextFormField(
                                        controller: TextEditingController(),
                                        maxLines: 1,
                                        validator: (value) {},
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
                                          hintText: 'search',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.r),
                                            borderSide: BorderSide(color: orange),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Container(
                                    width: double.infinity,

                                    child: InsightProductsTables(insightProduct: insightsProduct,),
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(

                                    children: [
                                      GestureDetector(
                                        onTap:(){

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
                      ),
                    ],
                  ),
                )


              ],
            ),
          );
        },

      ),
    );
  }
}
