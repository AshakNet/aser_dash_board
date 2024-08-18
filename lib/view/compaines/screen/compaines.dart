import 'package:aser_dash_board/logic/compaines/compines_cubit/companies_Cubit.dart';
import 'package:aser_dash_board/view/compaines/screen/insigth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'companies_details.dart';
import 'companis_content.dart';
import 'notification.dart';


class Compaines extends StatelessWidget {
  PageController company = PageController();
   Compaines({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context)=>CompaniesCubit(),
      child: PageView(
        controller: company,
        children: [
          CompanisContent(companyContent: company,),

          CompaniesDetails(companyDetails: company,),

          InsightCompanies(insightCompaines: company,),

          NotificationCompaines(notification: company,)
        ],
      ),
    );
  }
}
