
import 'package:aser_dash_board/logic/user_cubit/user_cubit.dart';
import 'package:aser_dash_board/view/settings/personal_information/personalinformation.dart';
import 'package:aser_dash_board/view/settings/setting_content/setting_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_Profile/edit_profile.dart';
import 'employee/add_employee.dart';
import 'employee/employee.dart';

class Settings extends StatelessWidget {
  PageController settings = PageController();
   Settings({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>UserCubit()..load(),
      child: PageView(
        controller:settings ,
        children: [
          SettingContent(settingContent: settings,),
          PersonalInformation(personalInformation: settings,),
          EditProfile(editProfile: settings,),
          Employee(employee: settings,),
          AddEmployee(addEmployee: settings,)
        ],
      ),
    );
  }
}
