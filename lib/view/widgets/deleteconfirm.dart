
import 'package:flutter/material.dart';


import '../../common/app_colors.dart';
import '../../common/textconstants.dart';

class DeleteAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
            "Delete Account",
            style: NeededTextstyles.style4
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
                "Are you sure you want to delete your account?",
                style: NeededTextstyles.style3
            ),
            SizedBox(height: 8),
            // Description
            Text(
                "Deleting your account will permanently remove all your data, including your order history, preferences, and uploaded documents. This action cannot be undone.",
                style: NeededTextstyles.style2
            ),
            SizedBox(height: 16),
            // Warning Section
            Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: red, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                      "Any ongoing orders or payments will be canceled, and related parties may be notified.",
                      style: NeededTextstyles.style5
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                              "Confirm Delete",
                              style: NeededTextstyles.style6
                          ),
                          content: Text(
                              "Are you sure you want to delete your account? This action cannot be undone.",
                              style: NeededTextstyles.style2
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                  "Cancel",
                                  style: NeededTextstyles.style2
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Account deleted successfully.",
                                      style: NeededTextstyles.style05,),
                                  ),
                                );
                                // Navigator.pop(context);
                              },
                              child: Text(
                                "Delete",
                                style: NeededTextstyles.style7,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:red,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Delete Account",
                      style: NeededTextstyles.style8,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {

                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style:  NeededTextstyles.style9,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DeleteAccount {
  static const String terms = """
Its so hard to see this!

Once you choose to delete your account , your account will no longer be available to you and you will not be able to activate , restore or use the account again. 

Please ensure that you have read and understood the following :

There are no pending orders, cancellations, returns, refunds or other requests (“Transactions”). If there are pending Transactions, please raise your account deletion request once the Transactions are completed.
If you hold any subscription or membership, you will lose all benefits and rewards associated with it immediately upon deletion of the account.
After your account is deleted, if you log into the Platform using the same phone no. or email ID, a fresh new account will be created and your old account data will not be accessible.
You have exhausted or do not intend to use SuperCoins, Gift Cards or any such reward points or balances associated with your account. Please note that once your account is deleted, immediately you will not be able to access any such reward points.
You will not be able to access or request to access order history, profile, wishlists, saved addresses, previous orders and invoices, save or preferred payment methods, content, images or use any of the products and services offered by the Platform immediately on deletion and will have to create a new account to use products and services offered by us.


""";
}