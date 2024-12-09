
import 'package:bizhingebase/authenication/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../common/app_colors.dart';
import '../../../common/textconstants.dart';
import '../detailedviews/addresss.dart';
import '../detailedviews/profileviews/deleteacc.dart';
import '../detailedviews/profileviews/editprofile.dart';
import '../detailedviews/profileviews/help.dart';
import '../detailedviews/profileviews/notificationsetting.dart';
import '../detailedviews/profileviews/orderdetailscreen.dart';
import '../detailedviews/profileviews/privacy.dart';
import '../detailedviews/profileviews/terms.dart';


class Item {
  final String name;
  final IconData icon;
 final Widget destination;

  Item({
    required this.name,
    required this.icon,
    required this.destination,
  });
}

class Profile extends StatelessWidget {
  final String companyName;
  final String contactPerson;

  Profile({super.key, required this.companyName, required this.contactPerson, });

  final List<Item> items = [
    Item(
      name: "Account Settings",
      icon: Icons.settings,
    destination: EditProfile(),
    ),
    Item(
      name: "Orders",
      icon: Icons.shopping_cart_sharp,
      destination: Order(),
    ),
    Item(
      name: "Notification Settings",
      icon: Icons.notifications,
      destination: NotificationSettingsScreen(),
    ),
    Item(
      name: "Terms and Conditions",
      icon: Icons.handshake_rounded,
     destination: TermsPage(),
    ),
    Item(
      name: "Privacy and Security",
      icon: Icons.security_outlined,
     destination: Privacy(),
    ),
    Item(
      name: "Help and Support Center",
      icon: Icons.help,
      destination: HelpCenterPage(),
    ),
    Item(
      name: "Delete Account",
      icon: Icons.delete_forever,
      destination: Deleteee(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 24, color: black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: black,
                      child: Icon(Icons.maps_home_work_sharp, color: white, size: 30),
                    ),SizedBox(width: 20,),
                    Padding(
                      padding: const EdgeInsets.only(right: 160),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            companyName,
                            style: NeededTextstyles.styblackish,
                          ),
                          Text(
                            contactPerson,
                            style: NeededTextstyles.style03,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditProfile()),
                        );
                      },
                      icon: Icon(Icons.edit_calendar_outlined, size: 20, color: black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ListTile(
                      leading: Icon(
                        items[index].icon,
                        color: maintheme1,
                        size: 24,
                      ),
                      title: Text(
                        items[index].name,
                        style: NeededTextstyles.blc15,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => items[index].destination,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: maintheme1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "LOG OUT",
                    style: NeededTextstyles.whit15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
