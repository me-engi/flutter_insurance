import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insuarnce_app/controllers/insurance_controllers.dart';
import 'package:insuarnce_app/screens/add_insurance_person_screen.dart';
import 'package:insuarnce_app/screens/add_insured_familymember_screen.dart';
import 'package:insuarnce_app/screens/insurance_details_screen.dart';

import 'package:insuarnce_app/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  final InsurancePersonController insurancePersonController = Get.find();
  final InsuredFamilyMemberController insuredFamilyMemberController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SearchScreen());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        color: Colors.green,
        child: InsurancePersonDetailsScreen()

      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Get.to(() => AddInsuranceScreen());
            },
            tooltip: 'Add Insurance Person',
            child: Icon(Icons.person_add),
          ),
          SizedBox(height: 16),

        ],
      ),
    );
  }
}
