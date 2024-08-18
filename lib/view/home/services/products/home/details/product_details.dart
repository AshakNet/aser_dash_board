import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/productCubit/products_cubit.dart';


import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  PageController productDetails = PageController();
   ProductDetails({super.key,required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
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
                        productDetails.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: CustomText(
                          text: "Accommodations<<",
                          size: 12.sp,
                          color: darkGrey,
                          fontWeight: FontWeight.w600)),
                  CustomText(
                      text: "Sonesta St. George Hotel - Convention.<<",
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
                      ProductCubit.get(context).toggle(0);

                    },
                    child: Container(
                      width: 167.w,
                      height: 50.h,
                      color:ProductCubit.get(context).change == 0 ? orange : white
                      ,
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

                      productDetails.animateToPage(4, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
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
                      productDetails.animateToPage(3, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60.w,
                ),
                Expanded(
                    flex: 2,
                    child: Container(


                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20.r),
                        color: white,

                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
                        child: Column(
                          children: [
                            CustomText(text: "Service Details", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                            SizedBox(height: 20.h,),
                            CustomText(text: "Product Title", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                            SizedBox(height: 20.h,),
                            CustomText(text: "Wooden and Leather Products", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                            SizedBox(height: 20.h,),
                            CustomText(text: "Products details", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                            SizedBox(height: 20.h,),
                            SizedBox(
                              height: 600.h,width: 500.w,
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 100.0.w,
                                mainAxisSpacing: 16.0,
                                childAspectRatio: 1,

                                children: const <Widget>[
                                  ProductCard(
                                    imageUrl: 'https://www.marketchino.com/media/catalog/product/cache/1/thumbnail/600x/17f82f742ffe127f42dca9de82fb58b1/b/a/bag13_2_4.jpg',
                                    title: 'Crochet Bags',
                                    price: '500',
                                  ),
                                  ProductCard(
                                    imageUrl: 'https://www.marketchino.com/media/catalog/product/cache/1/thumbnail/600x/17f82f742ffe127f42dca9de82fb58b1/b/a/bag13_2_4.jpg',
                                    title: 'Crochet Bags',
                                    price: '500',
                                  ),
                                  // Add more ProductCards here
                                ],
                              ),
                            ),





                          ],
                        ),
                      ),

                    )
                ),
                SizedBox(
                  width: 60.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius:
                            BorderRadiusDirectional.circular(20.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/home/pesrson.png"),
                              ),
                              CustomText(
                                text: "Al Amal Company",
                                size: 20.sp,
                                color: black,
                                fontWeight: FontWeight.w600,
                                textDecoration: TextDecoration.underline,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/home/profile.png"),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  CustomText(
                                    text: "mahmoud",
                                    size: 14.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  CustomText(
                                    text: "(Owner)",
                                    size: 14.sp,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w600,
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
                                    text: " : Status  ",
                                    size: 14.sp,
                                    color: black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  CustomText(
                                    text: "Active",
                                    size: 14.sp,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 120.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadiusDirectional.circular(
                                            10.r),
                                        border: Border.all(color: darkGrey)),
                                    child: CustomText(
                                      text: "Delete ",
                                      size: 16.sp,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Container(
                                    width: 120.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadiusDirectional.circular(
                                            10.r),
                                        border: Border.all(color: darkGrey)),
                                    child: CustomText(
                                      text: "Restrict ",
                                      size: 16.sp,
                                      color: black,
                                      fontWeight: FontWeight.w600,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: CustomText(
                                  text: "Contact Details",
                                  size: 20.sp,
                                  color: black,
                                  fontWeight: FontWeight.w600,
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Image.asset(
                                        "assets/images/home/address.png"),
                                    CustomText(
                                        text:
                                        "23 Abbas El Aqqad st - Naser city - Cairo",
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40.w),
                                child: CustomText(
                                  text: "Address Link",
                                  size: 16.sp,
                                  color: orange,
                                  fontWeight: FontWeight.w400,
                                  alignment: Alignment.centerLeft,
                                  textDecoration: TextDecoration.underline,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/home/phon.png"),
                                    CustomText(
                                        text: "20 1057842254+",
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Image.asset(
                                        "assets/images/home/location.png"),
                                    CustomText(
                                      text: "Website",
                                      size: 16.sp,
                                      color: orange,
                                      fontWeight: FontWeight.w400,
                                      textDecoration: TextDecoration.underline,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  width: 60.w,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}




class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0.sp,
                    color: black
                  ),
                ),
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(text: price, size: 14.sp, color: orange, fontWeight: FontWeight.w700,),
                    SizedBox(width: 5.w,),
                    CustomText(text: "EGP / Price", size: 14.sp, color: orange, fontWeight: FontWeight.w700,)
                  ],
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
