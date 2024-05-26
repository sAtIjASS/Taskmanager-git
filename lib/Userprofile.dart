import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Ecommerce_app/About.dart';
import 'Ecommerce_app/Bankdetails.dart';
import 'Ecommerce_app/Return Policy.dart';
import 'Ecommerce_app/Terms and Conditions.dart';

void main() {
  runApp(GetMaterialApp(home: MyAppUser()));
}

class MyAppUser extends StatefulWidget {
  @override
  State<MyAppUser> createState() => _MyAppUserState();
}

class _MyAppUserState extends State<MyAppUser> {
  final NavigationController _navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body:  PageView(
          controller: _navController.pageController,
          onPageChanged: _navController.onPageChanged,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap:(){
                      _navController.onItemTapped(1);
              },
                      child: ListTile(
                        leading: Icon(Icons.account_circle, color: Colors.blue, size: 40),
                        title: Text('Account Details'),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap:(){
                        _navController.onItemTapped(2);
                      },
                      child: ListTile(
                        leading: Icon(Icons.edit, color: Colors.blue, size: 40),
                        title: Text('Edit Profile'),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap:(){
                        _navController.onItemTapped(3);
                      },
                      child: ListTile(
                        leading: Icon(Icons.account_balance_wallet, color: Colors.blue, size: 40),
                        title: Text('Bank & UPI Details'),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                         return  Return();

                       }));
                        },
                      child: ListTile(
                        leading: Icon(Icons.policy, color: Colors.blue, size: 40),
                        title: Text('Return Policy'),
                      ),
                    ),
                    Divider(),

                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Terms();
                        }));
                      },
                      child: ListTile(
                        leading: Icon(Icons.verified_user, color: Colors.blue, size: 40),
                        title: Text(
                          'Terms and Conditions',
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return AboutUs();
                        }));
                      },
                      child: ListTile(
                        leading: Icon(Icons.info, color: Colors.blue, size: 40),
                        title: Text(
                          'About Us',
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Text(" UrbanCart is dedicated to providing the best online shopping experience. With a wide range of products, competitive prices, and exceptional customer service, we aim to exceed your expectations. Learn more about our journey and values on our About Us page.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),
            ),



            // Second page
            Container(
              child: Text("Second Page"),
            ),
            // Third page
            Container(
              child: Text("Third Page"),
            ),
            // Fourth page
            Container(
              child: BankUPIDetailsPage(),
            ),
             ],
        ),
      bottomNavigationBar: Obx(() {
        return ConvexAppBar(
          items: [
            TabItem(icon: Icons.home),
            TabItem(icon: Icons.account_circle),
            TabItem(icon:Icons.edit),
            TabItem(icon:Icons.account_balance_wallet)
          ],
          initialActiveIndex: _navController.selectedIndex.value,
          onTap: _navController.onItemTapped,
        );
      }),
    );
  }
}

class NavigationController extends GetxController {
  var selectedIndex = 3.obs;
  PageController pageController = PageController(initialPage: 3);

  void onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }


  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
