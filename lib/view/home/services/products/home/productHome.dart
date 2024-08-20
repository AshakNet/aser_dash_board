import 'package:aser_dash_board/logic/productCubit/product_state.dart';
import 'package:aser_dash_board/logic/productCubit/products_cubit.dart';
import 'package:aser_dash_board/view/home/services/products/add_Product/add_product.dart';
import 'package:aser_dash_board/view/home/services/products/home/details/product_details.dart';

import 'package:aser_dash_board/view/home/services/products/home/products.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'insight/insigthProduct.dart';
import 'order/details_order.dart';
import 'order/order.dart';


class ProductHome extends StatelessWidget {
  PageController productController = PageController();
  ProductHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(

      create: (BuildContext context)=>ProductCubit()..load(),
      child: PageView(
        controller:productController ,
        children: [
          /// 0
          Products(product: productController,),
          /// 1
          AddProducts(addProduct: productController,),
          /// 2
          ProductDetails(productDetails: productController,),
          /// 3
          InsightsProducts(insightsProduct: productController,),
          /// 4
          OrderProducts(order: productController,),
          /// 5
          OrderDetailsProduct(detailsOrder: productController,)



        ],
      )
    );
  }
}
