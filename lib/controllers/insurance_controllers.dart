import 'package:get/get.dart';
import 'package:insuarnce_app/models/insurance_family_member.dart';
import 'package:insuarnce_app/models/insurance_person.dart';
import 'package:insuarnce_app/services/api_service.dart';

class InsurancePersonController extends GetxController {
  final RxList<InsurancePerson> insurancePersons = <InsurancePerson>[].obs;
  final ApiService apiService;

  InsurancePersonController(this.apiService);

  get isLoading => null;

  @override
  void onInit() {
    fetchInsurancePersons();
    super.onInit();
  }

  Future<void> fetchInsurancePersons() async {
    try {
      final List<dynamic> data = await apiService.fetchInsurancePersons();
      final List<InsurancePerson> insuranceList = data.map((e) => InsurancePerson.fromJson(e)).toList();
      insurancePersons.assignAll(insuranceList);
    } catch (e) {
      print('Error fetching Insurance Persons: $e');
    }
  }

  void addInsurancePerson(InsurancePerson newInsurancePerson) {
    insurancePersons.add(newInsurancePerson);
  }

  void searchInsurancePersons(String query) {
    if (query.isEmpty) {
      fetchInsurancePersons(); // Fetch all when the query is empty
    } else {
      final List<InsurancePerson> results = insurancePersons
          .where((person) => person.firstName.toLowerCase().contains(query.toLowerCase()))
          .toList();
      insurancePersons.assignAll(results);
    }
  }
}

class InsuredFamilyMemberController extends GetxController {
  final RxList<InsuredFamilyMember> insuredFamilyMembers = <InsuredFamilyMember>[].obs;
  final ApiService apiService;

  InsuredFamilyMemberController(this.apiService);

  @override
  void onInit() {
    fetchInsuredFamilyMembers();
    super.onInit();
  }

  Future<void> fetchInsuredFamilyMembers() async {
    try {
      final List<dynamic> data = await apiService.fetchInsuredFamilyMembers();
      final List<InsuredFamilyMember> familyMembers = data.map((e) => InsuredFamilyMember.fromJson(e)).toList();
      insuredFamilyMembers.assignAll(familyMembers);
    } catch (e) {
      print('Error fetching Insured Family Members: $e');
    }
  }

  void addInsuredFamilyMember(InsuredFamilyMember newFamilyMember) {
    insuredFamilyMembers.add(newFamilyMember);
  }

  void searchInsuredFamilyMembers(String query) {
    if (query.isEmpty) {
      fetchInsuredFamilyMembers(); // Fetch all when the query is empty
    } else {
      final List<InsuredFamilyMember> results = insuredFamilyMembers
          .where((member) => member.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      insuredFamilyMembers.assignAll(results);
    }
  }
}
