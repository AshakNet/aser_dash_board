// import 'dart:io';
//
// import 'package:aser_dash_board/constant/color.dart';
// import 'package:aser_dash_board/logic/productCubit/product_state.dart';
// import 'package:aser_dash_board/logic/productCubit/products_cubit.dart';
//
// import 'package:aser_dash_board/widgets/customText/customtext.dart';
// import 'package:aser_dash_board/widgets/formField/formField.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class AddProducts extends StatelessWidget {
//   PageController addProduct = PageController();
//
//   AddProducts({super.key, required this.addProduct});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ProductCubit, ProductState>(
//       listener: (context, state) {
//         if(state is AddProductLoading){
//           showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (context) {
//               return Center(
//                   child: CircularProgressIndicator(
//                     color: orange,
//                   ));
//             },
//           );
//         }
//         else if(state is AddProductSuccess){
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               backgroundColor:Colors.green,
//               content: Text('create Product SuccessFul'),
//               duration: Duration(seconds: 2),
//             ),
//           );
//           Navigator.pop(context);
//         }
//         else if ( state is AddProductFailure){
//           ScaffoldMessenger.of(context).showSnackBar(
//              SnackBar(
//               backgroundColor:Colors.red,
//               content: Text(state.error),
//               duration: Duration(seconds: 2),
//             ),
//           );
//           Navigator.pop(context);
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           body: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
//             child: SingleChildScrollView(
//               child: Form(
//                 key: ProductCubit.get(context).formKey,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
//                       child: Row(
//                         children: [
//                           CustomText(
//                               text: "Services",
//                               size: 12.sp,
//                               color: darkGrey,
//                               fontWeight: FontWeight.w600),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           GestureDetector(
//                               onTap: () {
//                                 addProduct.animateToPage(0,
//                                     duration: Duration(milliseconds: 5),
//                                     curve: Curves.easeIn);
//                               },
//                               child: CustomText(
//                                   text: "Products<<",
//                                   size: 12.sp,
//                                   color: darkGrey,
//                                   fontWeight: FontWeight.w600)),
//                           CustomText(
//                               text: "Add Product<<",
//                               size: 12.sp,
//                               color: black,
//                               fontWeight: FontWeight.w700),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                             flex: 60,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20.r),
//                                 color: white,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 20.w, vertical: 40.h),
//                                     child: CustomText(
//                                       text: "Add Product",
//                                       size: 18.sp,
//                                       color: black,
//                                       fontWeight: FontWeight.w700,
//                                       alignment: Alignment.centerLeft,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 20.w),
//                                     child: CustomText(
//                                       text: "Product name",
//                                       size: 14.sp,
//                                       color: black,
//                                       fontWeight: FontWeight.w500,
//                                       alignment: Alignment.centerLeft,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//                                   textFormFildBuilder(context,
//                                       width: 597.w,
//                                       hint: "Enter the product name",
//                                       controller: ProductCubit.get(context).productName,
//                                       validation: (value) {
//                                         if (value!.isEmpty) {
//                                           return "Please Enter name";
//                                         }
//                                         return null;
//                                       },
//
//                                   ),
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10.w),
//                                     child: roomNumBuilder(
//                                         function: ProductCubit.get(context)
//                                             .changeSingleRoomNum,
//                                         number: ProductCubit.get(context)
//                                             .singleRoomNum,
//                                         title: "For Piece"),
//                                   ),
//
//                                   SizedBox(
//                                     height: 20.h,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 20.w),
//                                     child: CustomText(
//                                       text: "Product  Price (EGP)",
//                                       size: 14.sp,
//                                       color: black,
//                                       fontWeight: FontWeight.w500,
//                                       alignment: Alignment.centerLeft,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Padding(
//
//                                         padding:  EdgeInsets.symmetric(horizontal: 20.w),
//                                         child: SizedBox(
//                                           width:597.w ,
//
//                                           child: TextFormField(
//                                             controller: ProductCubit.get(context).productPrice,
//                                             maxLines: 1,
//                                             minLines: 1,
//
//
//                                             validator: (value){
//                                               if (value!.isEmpty) {
//                                                 return "Please Enter price";
//                                               }
//                                             },
//                                             inputFormatters: [
//                                               FilteringTextInputFormatter.digitsOnly, // Allow only digits
//                                             ],
//                                             style: TextStyle(
//                                               fontSize: 16.sp,
//                                               color: Colors.black,
//                                             ),
//                                             decoration: InputDecoration(
//
//
//                                               fillColor: Color.fromRGBO(247, 247, 247, 1),
//                                               contentPadding: EdgeInsets.symmetric(
//                                                 horizontal: 13.w,
//                                                 vertical: 20.h,
//                                               ),
//                                               constraints: BoxConstraints(
//                                                 minHeight: 64.h,
//                                                 minWidth: 372.w,
//                                               ),
//
//                                               hintStyle: TextStyle(
//                                                 fontSize: 16.sp,
//                                                 color: darkGrey,
//                                               ),
//                                               hintText: "Enter the product price",
//                                               border: OutlineInputBorder(
//                                                 borderRadius: BorderRadius.circular(8.r),
//                                                 borderSide: BorderSide(color: orange),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 20.w),
//                                     child: CustomText(
//                                       text: "Product Store",
//                                       size: 14.sp,
//                                       color: black,
//                                       fontWeight: FontWeight.w500,
//                                       alignment: Alignment.centerLeft,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//                                   Row(
//                                     children: [
//                                       textFormFildBuilder(context,
//                                           width: 597.w,
//                                           hint: "Enter store",
//                                           controller: ProductCubit.get(context).productStore,
//                                           validation: (value) {
//                                             if (value!.isEmpty) {
//                                               return "Please Enter store";
//                                             }
//                                             return null;
//                                           }),
//
//                                     ],
//                                   ),
//
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 20.w),
//                                     child: CustomText(
//                                       text: "Product Description",
//                                       size: 14.sp,
//                                       color: black,
//                                       fontWeight: FontWeight.w500,
//                                       alignment: Alignment.centerLeft,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//                                   textFormFildBuilder(context,
//                                       width: 597.w,
//                                       hint: "Enter the trip name",
//                                       controller: ProductCubit.get(context).productDescription,
//                                       validation: (value) {
//                                         if (value!.isEmpty) {
//                                           return "Please Enter description";
//                                         }
//                                         return null;
//                                       },
//                                       manLines: 4,
//                                       maxLines: 5),
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 20.w),
//                                     child: CustomText(
//                                       text: "Photos ",
//                                       size: 14.sp,
//                                       color: black,
//                                       fontWeight: FontWeight.w500,
//                                       alignment: Alignment.centerLeft,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 20.w),
//                                     child: Container(
//                                       width: 597.w,
//                                       height: 200.h,
//                                       decoration: BoxDecoration(
//                                           border: Border.all(color: darkGrey),
//                                           borderRadius:
//                                               BorderRadiusDirectional.circular(
//                                                   20.r)),
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           ProductCubit.get(context).addServiceImagesDesign(context);
//                                         },
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Image.asset(
//                                               "assets/images/home/upload.png",
//                                               color: orange,
//                                             ),
//                                             SizedBox(
//                                               height: 15.h,
//                                             ),
//                                             CustomText(
//                                                 text: " Upload photo",
//                                                 size: 14.sp,
//                                                 color: orange,
//                                                 fontWeight: FontWeight.w600),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 20.h,),
//                                   ProductCubit.get(context)
//                                       .imageFileList
//                                       !.isNotEmpty
//                                       ? SizedBox(
//                                     height: 400.h,
//                                     child: GridView.builder(
//                                       gridDelegate:
//                                       const SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 3,
//                                         crossAxisSpacing: 4.0,
//                                         mainAxisSpacing: 4.0,
//                                       ),
//                                       itemCount: ProductCubit.get(context)
//                                           .imageFileList!
//                                           .length -1 ,
//                                       itemBuilder: (context, index) {
//                                         return GestureDetector(
//                                           onTap: (){
//                                             print(ProductCubit.get(context)
//                                                 .imageFileList!
//                                                 [0].path);
//                                           },
//                                           child: Image.file(
//                                             File(ProductCubit.get(context)
//                                                 .imageFileList![index]
//                                                 .path),
//                                             fit: BoxFit.cover,
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   )
//                                       :  Center(
//                                       child: Text('No images selected.',style: TextStyle(color: Colors.black,fontSize: 30.sp,fontWeight: FontWeight.w600),)),
//                                 ],
//                               ),
//                             )),
//                         SizedBox(
//                           width: 40.w,
//                         ),
//                         Expanded(
//                             flex: 40,
//                             child: Column(
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20.r),
//                                     color: white,
//                                   ),
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(vertical: 20.h),
//                                     child: Column(
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 20.w),
//                                           child: CustomText(
//                                             text: "Company Name",
//                                             size: 14.sp,
//                                             color: black,
//                                             fontWeight: FontWeight.w500,
//                                             alignment: Alignment.bottomLeft,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 20.h,
//                                         ),
//                                         Container(
//
//                                           decoration: BoxDecoration(
//                                               color: white,
//                                               borderRadius: BorderRadiusDirectional.circular(10.r),
//                                               border: Border.all(color: darkGrey)
//                                           ),
//                                           child: Padding(
//
//                                             padding: EdgeInsets.symmetric(horizontal: 20.w),
//                                             child: SizedBox(
//
//                                               child: DropdownButton(
//                                                   menuMaxHeight: 200.0,hint: CustomText(text: "enter company name", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600),
//
//                                                   isExpanded: true,
//                                                   focusColor: white,
//                                                   dropdownColor: white,
//
//                                                   icon: Align(
//                                                       alignment: Alignment.center,
//                                                       child: Icon(Icons.keyboard_arrow_down,
//                                                           color: orange, size: 30.sp)),
//                                                   borderRadius: BorderRadius.circular(10.r),
//                                                   underline: SizedBox(),
//                                                   value: ProductCubit.get(context).selectCompanyVar,
//
//                                                   items: ProductCubit.get(context).getAllCompanyModel?.data
//                                                       ?.map((e) => DropdownMenuItem(
//                                                     value: e.id,
//                                                     child: Padding(
//                                                       padding: EdgeInsets.only(
//                                                           right: 20.w),
//
//                                                       child: CustomText(
//                                                         text: e.name.toString(),
//                                                         color: orange,
//                                                         fontWeight: FontWeight.w700,
//                                                         size: 14.sp,
//                                                         alignment: Alignment.center,
//                                                       ),
//                                                     ),
//                                                   ))
//                                                       .toList(),
//                                                   onChanged: (val) {
//                                                     ProductCubit.get(context)
//                                                         .selectCompany(val);
//                                                     print(val);
//                                                   }),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 40.h,
//                                 ),
//                                 GestureDetector(
//                                   onTap: (){
//                                     if(ProductCubit.get(context).formKey.currentState!.validate()){
//                                       if(ProductCubit.get(context).singleRoomNum == 0 ){
//                                         ScaffoldMessenger.of(context).showSnackBar(
//                                            SnackBar(
//                                             backgroundColor: darkGrey,
//                                             content: Text('enter Available Number'),
//                                             duration: Duration(seconds: 2),
//                                           ),
//                                         );
//                                       }
//                                       else if (ProductCubit.get(context).selectCompanyVar == null){
//                                         ScaffoldMessenger.of(context).showSnackBar(
//                                            SnackBar(
//                                             backgroundColor: darkGrey,
//                                             content: Text('enter company Name'),
//                                             duration: Duration(seconds: 2),
//                                           ),
//                                         );
//                                       }
//                                       else if (ProductCubit.get(context).categoryType == null){
//                                         ScaffoldMessenger.of(context).showSnackBar(
//                                            SnackBar(
//                                             backgroundColor:darkGrey,
//                                             content: Text('enter category Name'),
//                                             duration: Duration(seconds: 2),
//                                           ),
//                                         );
//                                       }
//                                       else if(ProductCubit.get(context).imageFileList!.isEmpty){
//                                         ScaffoldMessenger.of(context).showSnackBar(
//                                           SnackBar(
//                                             backgroundColor:darkGrey,
//                                             content: Text('enter image '),
//                                             duration: Duration(seconds: 2),
//                                           ),
//                                         );
//                                       }
//                                       else{
//                                         ProductCubit.get(context).addProduct();
//                                       }
//
//                                     }
//
//                                   },
//                                   child: Container(
//                                     width: double.infinity,
//                                     height: 60.h,
//                                     decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadiusDirectional.circular(10.r),
//                                         color: orange),
//                                     child: CustomText(
//                                       text: "Add Product",
//                                       size: 16.sp,
//                                       color: white,
//                                       fontWeight: FontWeight.w600,
//                                       alignment: Alignment.center,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20.h,
//                                 ),
//                                 Container(
//                                   width: double.infinity,
//                                   height: 60.h,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(color: darkGrey),
//                                     borderRadius:
//                                         BorderRadiusDirectional.circular(10.r),
//                                   ),
//                                   child: CustomText(
//                                     text: "Clear",
//                                     size: 16.sp,
//                                     color: orange,
//                                     fontWeight: FontWeight.w600,
//                                     alignment: Alignment.center,
//                                   ),
//                                 )
//                               ],
//                             ))
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// ListTile roomNumBuilder({
//   required Function function,
//   required String title,
//   required int number,
// }) {
//   return ListTile(
//     title: Column(
//       children: [
//         CustomText(
//           text: "Available number",
//           size: 14.sp,
//           color: black,
//           fontWeight: FontWeight.w600,
//           alignment: Alignment.centerLeft,
//         ),
//         SizedBox(
//           height: 10.h,
//         ),
//         Row(
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 color: black,
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(
//               width: 20.w,
//             ),
//             GestureDetector(
//               onTap: () {
//                 function(isAdded: false);
//               },
//               child: Icon(
//                 Icons.remove_circle_outline,
//                 size: 24.sp,
//               ),
//             ),
//             SizedBox(
//               width: 20.w,
//             ),
//             Text(
//               number.toString(),
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: black,
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             SizedBox(
//               width: 20.w,
//             ),
//             GestureDetector(
//               onTap: () {
//                 function(isAdded: true);
//               },
//               child: Icon(
//                 Icons.add_circle_outline,
//                 size: 24.sp,
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
import 'dart:io';

import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/productCubit/product_state.dart';
import 'package:aser_dash_board/logic/productCubit/products_cubit.dart';

import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:aser_dash_board/widgets/formField/formField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProducts extends StatelessWidget {
  PageController addProduct = PageController();

  AddProducts({super.key, required this.addProduct});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if(state is AddProductLoading){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Center(
                  child: CircularProgressIndicator(
                    color: orange,
                  ));
            },
          );
        }
        else if(state is AddProductSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor:Colors.green,
              content: Text('create Product SuccessFul'),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        }
        else if ( state is AddProductFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor:Colors.red,
              content: Text(state.error),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Form(
                key: ProductCubit.get(context).formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                      child: Row(
                        children: [
                          CustomText(
                              text: "Services",
                              size: 12.sp,
                              color: darkGrey,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
                              onTap: () {
                                addProduct.animateToPage(0,
                                    duration: Duration(milliseconds: 5),
                                    curve: Curves.easeIn);
                              },
                              child: CustomText(
                                  text: "Products<<",
                                  size: 12.sp,
                                  color: darkGrey,
                                  fontWeight: FontWeight.w600)),
                          CustomText(
                              text: "Add Product<<",
                              size: 12.sp,
                              color: black,
                              fontWeight: FontWeight.w700),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 40.h),
                                    child: CustomText(
                                      text: " Add Product",
                                      size: 18.sp,
                                      color: black,
                                      fontWeight: FontWeight.w700,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(
                                      text: "Product name",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w500,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  textFormFildBuilder(context,
                                      width: 597.w,
                                      hint: "Enter the product name",
                                      controller: ProductCubit.get(context).productName,
                                      validation: (value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter name";
                                        }
                                        return null;
                                      },
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 10.w),
                                    child: roomNumBuilder(
                                        function: ProductCubit.get(context)
                                            .changeSingleRoomNum,
                                        number: ProductCubit.get(context)
                                            .singleRoomNum,
                                        title: "For Piece"),
                                  ),

                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(
                                      text: "Product  Price (EGP)",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w500,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Padding(

                                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                        child: SizedBox(
                                          width:597.w ,

                                          child: TextFormField(
                                            controller: ProductCubit.get(context).productPrice,
                                            maxLines: 1,
                                            minLines: 1,


                                            validator: (value){
                                              if (value!.isEmpty) {
                                                return "Please Enter price";
                                              }
                                            },
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly, // Allow only digits
                                            ],
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(


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
                                              hintText: "Enter the product price",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                borderSide: BorderSide(color: orange),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Row(
                                      children: [
                                        CustomText(
                                          text: "Product Store",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w500,
                                          alignment: Alignment.centerLeft,
                                        ),

                                        SizedBox(width: 220.w,),
                                        CustomText(
                                          text: "Product Category",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w500,
                                          alignment: Alignment.centerLeft,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      textFormFildBuilder(context,
                                          width: 280.w,
                                          hint: "Enter store",
                                          controller: ProductCubit.get(context).productStore,
                                          validation: (value) {
                                            if (value!.isEmpty) {
                                              return "Please Enter store";
                                            }
                                            return null;
                                          }),
                                      Container(
                                        width: 300.w,

                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: BorderRadiusDirectional.circular(10.r),
                                            border: Border.all(color: darkGrey)
                                        ),
                                        child: Padding(

                                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                                          child: SizedBox(

                                            child: DropdownButton(
                                                menuMaxHeight: 250.0,hint: CustomText(text: "enter category name", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600),


                                                focusColor: white,
                                                dropdownColor: white,
                                                isExpanded: true,

                                                icon: Align(
                                                    alignment: Alignment.center,
                                                    child: Icon(Icons.keyboard_arrow_down,
                                                        color: orange, size: 30.sp)),
                                                borderRadius: BorderRadius.circular(10.r),
                                                underline: SizedBox(),
                                                value: ProductCubit.get(context).categoryType,

                                                items: ProductCubit.get(context).getAllCategoryProduct?.data
                                                    ?.map((e) => DropdownMenuItem(
                                                  value: e.id,
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
                                                      .selectCategory(val);
                                                  print(val);
                                                }),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(
                                      text: "Product Description",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w500,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  textFormFildBuilder(context,
                                      width: 597.w,
                                      hint: "Enter the trip name",
                                      controller: ProductCubit.get(context).productDescription,
                                      validation: (value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter description";
                                        }
                                        return null;
                                      },
                                      manLines: 4,
                                      maxLines: 5),
                                  SizedBox(
                                    height: 10.h,
                                  ),

                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(
                                      text: "Photos",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w500,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Container(
                                      width: 597.w,
                                      height: 200.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: darkGrey),
                                          borderRadius:
                                          BorderRadiusDirectional.circular(
                                              20.r)),
                                      child: GestureDetector(
                                        onTap: () {
                                          ProductCubit.get(context).addServiceImagesDesign(context);
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/home/upload.png",
                                              color: orange,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            CustomText(
                                                text: " Upload photo",
                                                size: 14.sp,
                                                color: orange,
                                                fontWeight: FontWeight.w600),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h,),
                                  ProductCubit.get(context)
                                      .imageFileList
                                  !.isNotEmpty
                                      ? SizedBox(
                                    height: 400.h,
                                    child: GridView.builder(
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 4.0,
                                        mainAxisSpacing: 4.0,
                                      ),
                                      itemCount: ProductCubit.get(context)
                                          .imageFileList!
                                          .length -1 ,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: (){
                                            print(ProductCubit.get(context)
                                                .imageFileList!
                                            [0].path);
                                          },
                                          child: Image.file(
                                            File(ProductCubit.get(context)
                                                .imageFileList![index]
                                                .path),
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                      :  Center(
                                      child: Text('No images selected.',style: TextStyle(color: Colors.black,fontSize: 30.sp,fontWeight: FontWeight.w600),)),
                                ],
                              ),
                            )),
                        SizedBox(
                          width: 40.w,
                        ),
                        Expanded(
                            flex: 40,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20.h),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: CustomText(
                                            text: "Company Name",
                                            size: 14.sp,
                                            color: black,
                                            fontWeight: FontWeight.w500,
                                            alignment: Alignment.bottomLeft,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Container(

                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius: BorderRadiusDirectional.circular(10.r),
                                              border: Border.all(color: darkGrey)
                                          ),
                                          child: Padding(

                                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                                            child: SizedBox(

                                              child: DropdownButton(
                                                  menuMaxHeight: 200.0,hint: CustomText(text: "enter company name", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600),

                                                  isExpanded: true,
                                                  focusColor: white,
                                                  dropdownColor: white,

                                                  icon: Align(
                                                      alignment: Alignment.center,
                                                      child: Icon(Icons.keyboard_arrow_down,
                                                          color: orange, size: 30.sp)),
                                                  borderRadius: BorderRadius.circular(10.r),
                                                  underline: SizedBox(),
                                                  value: ProductCubit.get(context).selectCompanyVar,

                                                  items: ProductCubit.get(context).getAllCompanyModel?.data
                                                      ?.map((e) => DropdownMenuItem(
                                                    value: e.id,
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
                                                        .selectCompany(val);
                                                    print(val);
                                                  }),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    if(ProductCubit.get(context).formKey.currentState!.validate()){
                                      if(ProductCubit.get(context).singleRoomNum == 0 ){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor: darkGrey,
                                            content: Text('enter Available Number'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                      else if (ProductCubit.get(context).selectCompanyVar == null){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor: darkGrey,
                                            content: Text('enter company Name'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                      else if (ProductCubit.get(context).categoryType == null){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor:darkGrey,
                                            content: Text('enter category Name'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                      else if(ProductCubit.get(context).imageFileList!.isEmpty){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor:darkGrey,
                                            content: Text('enter image '),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                      else{
                                        ProductCubit.get(context).addProduct();
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadiusDirectional.circular(10.r),
                                        color: orange),
                                    child: CustomText(
                                      text: "Add Products",
                                      size: 16.sp,
                                      color: white,
                                      fontWeight: FontWeight.w600,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    ProductCubit.get(context).productName.clear();
                                    ProductCubit.get(context).singleRoomNum = 0;
                                    ProductCubit.get(context).productPrice.clear();
                                    ProductCubit.get(context).categoryType = null;
                                    ProductCubit.get(context).productDescription.clear();
                                    ProductCubit.get(context).productStore.clear();
                                    ProductCubit.get(context).selectCompanyVar= null;


                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: darkGrey),
                                      borderRadius:
                                      BorderRadiusDirectional.circular(10.r),
                                    ),
                                    child: CustomText(
                                      text: "Clear",
                                      size: 16.sp,
                                      color: orange,
                                      fontWeight: FontWeight.w600,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

ListTile roomNumBuilder({
  required Function function,
  required String title,
  required int number,
}) {
  return ListTile(
    title: Column(
      children: [
        CustomText(
          text: "Available number",
          size: 14.sp,
          color: black,
          fontWeight: FontWeight.w600,
          alignment: Alignment.centerLeft,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            GestureDetector(
              onTap: () {
                function(isAdded: false);
              },
              child: Icon(
                Icons.remove_circle_outline,
                size: 24.sp,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              number.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            GestureDetector(
              onTap: () {
                function(isAdded: true);
              },
              child: Icon(
                Icons.add_circle_outline,
                size: 24.sp,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}