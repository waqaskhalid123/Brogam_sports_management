import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/ProfileProvider.dart';
import '../../../../widgets/LogoutButton/LogoutButton.dart';



class ProfileDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile header with image, name, email, and update button
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 3,left: 3),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      child: CircleAvatar(
                        radius: 30,

                        backgroundImage: AssetImage("assets/images/card2.png"), // Replace with your image asset
                      ),
                    ),
                    const SizedBox(width: 16),
                    Padding(
                      padding: const EdgeInsets.only(top:18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text('john1@gmail.com'),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 10),
                            child: InkWell(
                              onTap: (){
                                profileProvider.EditProfileNaviagtion(context);
                              },
                              child: Text(
                                'Update my information',
                                style: TextStyle(color: AppColors.primaryColor, decoration: TextDecoration.underline),
                              ),
                            ),
                          ),



                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // List of options/settings
            buildListTile(title: 'Card Details', icon:Icons.credit_card, onTap: () {  }),
            buildListTile(title: 'Change Password',icon: Icons.lock, onTap: () { profileProvider.ChangePasswordNaviagtion(context); }),
            buildListTile(title: 'Notification Settings',icon: Icons.notifications_none_outlined, onTap: () {profileProvider.NotificationSettingNaviagtion(context);  }),
            // buildSwitchTile('Location', true),
            buildListTile(title: 'Help & Support',icon: Icons.help_outline, onTap: () {  }),
            buildListTile(title: 'FAQs',icon:  Icons.question_answer, onTap: () {  }),
            buildListTile(title: 'Privacy Policy',icon:  Icons.privacy_tip, onTap: () {  }),
            const SizedBox(height: 20),
            LogoutButton(text: 'Logout', onPressed: () {  },),
            // Logout and Delete account buttons
           TextButton(onPressed: (){}, child: Text("Delete Account",style: TextStyle(
             decoration: TextDecoration.underline,
             fontSize: 16,
             fontFamily: AppFontsFamily.poppins,
             color: AppColors.CancelRed,
           ),))
          ],
        ),
      ),
    );
  }


  ListTile buildListTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios,color: AppColors.black,),
      onTap: onTap, // Call the required onTap function
    );
  }

  // Helper method for creating a switchable list tile (Location)
  // ListTile buildSwitchTile(String title, bool value) {
  //   return ListTile(
  //     leading: Icon(Icons.location_on, ),
  //     title: Text(title),
  //     trailing:  GFToggle(
  //       onChanged: (val){},
  //       value: true,
  //       enabledThumbColor:Colors.white,
  //       type: GFToggleType.ios,
  //       enabledTrackColor: AppColors.primaryColor,
  //     )
  //   );
  // }

  // Helper method for creating buttons (Logout, Delete account)
  ElevatedButton buildButton(String title, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(

        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

