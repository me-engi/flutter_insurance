import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insuarnce_app/controllers/insurance_controllers.dart';
import 'package:insuarnce_app/models/insurance_family_member.dart';
import 'package:insuarnce_app/models/insurance_person.dart';
import 'package:insuarnce_app/screens/insurance_details_screen.dart';


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InsurancePersonController insurancePersonController = Get.find();
    final InsuredFamilyMemberController familyMemberController = Get.find();

    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(labelText: 'Search'),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  insurancePersonController.searchInsurancePersons(value);
                  familyMemberController.searchInsuredFamilyMembers(value);
                } else {
                  insurancePersonController.fetchInsurancePersons();
                  familyMemberController.fetchInsuredFamilyMembers();
                }
              },
            ),
            SizedBox(height: 20),
            Obx(() {
              if (insurancePersonController.insurancePersons.isEmpty && familyMemberController.insuredFamilyMembers.isEmpty) {
                return Center(
                  child: Text('No results found.'),
                );
              }
              return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Insurance Persons:'),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: insurancePersonController.insurancePersons.length,
                      itemBuilder: (context, index) {
                        final InsurancePerson person = insurancePersonController.insurancePersons[index];
                        return ListTile(
                          title: Text(person.firstName),
                          subtitle: Text(person.email),
                          onTap: () {
                            // Navigate to InsurancePersonDetailsScreen when a person is tapped
                            Get.to(InsurancePersonDetailsScreen());
                          },
                        );
                      },
                    ),
                    Text('Insured Family Members:'),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: familyMemberController.insuredFamilyMembers.length,
                      itemBuilder: (context, index) {
                        final InsuredFamilyMember member = familyMemberController.insuredFamilyMembers[index];
                        return ListTile(
                          title: Text(member.name),
                          subtitle: Text(member.relationship),
                          onTap: () {
                            // Navigate to InsuredFamilyMemberDetailsScreen when a family member is tapped
                            Get.to(InsuredFamilyMemberDetailsScreen());
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
