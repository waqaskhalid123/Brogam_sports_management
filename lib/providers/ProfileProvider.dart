import 'package:flutter/material.dart';

import '../screens/Home/Profile/ProfileDetails/ChangePassword.dart';
import '../screens/Home/Profile/ProfileDetails/EditProfileScreen.dart';
import '../screens/Home/Profile/ProfileDetails/NotificationSettings.dart';

class ProfileProvider with ChangeNotifier {

  void EditProfileNaviagtion(BuildContext context) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EditProfile();
        },
      ),
    );


  }
  void ChangePasswordNaviagtion(BuildContext context) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ChangePassword();
        },
      ),
    );}
  void NotificationSettingNaviagtion(BuildContext context) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NotificationSettingsScreen ();
        },
      ),
    );}
}
