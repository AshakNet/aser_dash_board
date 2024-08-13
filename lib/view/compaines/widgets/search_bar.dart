import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/view/compaines/widgets/componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPar extends StatefulWidget {
  const SearchPar({super.key});

  @override
  State<SearchPar> createState() => _SearchParState();
}

class _SearchParState extends State<SearchPar> {
  List<String> companyServiceList = [
    "companyServiceList",
    "companyServiceList2"
  ];
  String companyServiceValue = "companyServiceList";

  List<String> companyGovernateList = [
    "giza",
    "cairo"
  ];
  String companyGovernateValue = "giza";
  List<String> companyProfitsList = [
    "Profits1",
    "Profits2"
  ];
  String companyProfitsValue = "Profits1";

  List<String> companyStateList = [
    "state1",
    "state2"
  ];
  String companyStateValue = "state1";
TextEditingController dataController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildDropdown(
          context: context,
          width: 200.w,
          titleColor: Colors.black,
          itemList: companyServiceList,
          onChanged: (String? value) {
            setState(() {
              companyServiceValue = value!;
            });
          },
          selectedValue: companyServiceValue,
          title: "Company Service",
          color: Colors.white,
        ),
        SizedBox(width:20.w,),
        buildDropdown(
          context: context,
          titleColor: Colors.black,

          itemList: companyGovernateList,
          onChanged: (String? value) {
            setState(() {
              companyGovernateValue = value!;
            });
          },
          selectedValue: companyGovernateValue,
          title: "Company Governate",
          color: Colors.white,
        ),
        SizedBox(width:20.w,),

        buildDropdown(
          context: context,
          titleColor: Colors.black,

          itemList: companyGovernateList,
          onChanged: (String? value) {
            setState(() {
              companyGovernateValue = value!;
            });
          },
          selectedValue: companyGovernateValue,
          title: "Company Governate",
          color: Colors.white,
        ),
        SizedBox(width:20.w,),

        buildDropdown(
          context: context,
          titleColor: Colors.black,

          itemList: companyProfitsList,
          onChanged: (String? value) {
            setState(() {
              companyProfitsValue = value!;
            });
          },
          selectedValue: companyProfitsValue,
          title: "Company Profits",
          color: Colors.white,
        ),
        SizedBox(width:20.w,),

        DefaultDateFormField(controller:dataController ,title: "Addition Date",color: Colors.white,),
        SizedBox(width:20.w,),

        buildDropdown(
          titleColor: Colors.black,
          context: context,
          itemList: companyStateList,
          onChanged: (String? value) {
            setState(() {
              companyStateValue = value!;
            });
          },
          selectedValue: companyStateValue,
          title: "Company State",
          //color: Colors.white,
        ),
      ],
    );
  }
}
