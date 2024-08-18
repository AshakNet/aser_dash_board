import 'package:aser_dash_board/view/home/settings/employee/add_employee.dart';
import 'package:aser_dash_board/view/home/settings/personal_information/personalinformation.dart';
import 'package:aser_dash_board/view/home/settings/setting_content/setting_content.dart';
import 'package:flutter/cupertino.dart';

import 'edit_Profile/edit_profile.dart';
import 'employee/employee.dart';

class Settings extends StatelessWidget {
  PageController settings = PageController();
   Settings({super.key});

  @override
  Widget build(BuildContext context) {

    return PageView(
      controller:settings ,
      children: [
        SettingContent(settingContent: settings,),
        PersonalInformation(personalInformation: settings,),
        EditProfile(editProfile: settings,),
        Employee(employee: settings,),
        AddEmployee(addEmployee: settings,)
      ],
    );
  }
}
