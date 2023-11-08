import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insuarnce_app/models/insurance_person.dart';

class ApiService {
  final String baseUrl; // Your Django API base URL

  ApiService(this.baseUrl);

  Future<List<Map<String, dynamic>>> fetchInsurancePersons() async {
    final response = await http.get(Uri.parse('$baseUrl/insurance-person/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load insurance persons');
    }
  }

  Future<List<Map<String, dynamic>>> fetchInsuredFamilyMembers() async {
    final response = await http.get(Uri.parse('$baseUrl/insured-family-member/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load insured family members');
    }
  }

  Future<Map<String, dynamic>> addInsurancePerson(Map<String, dynamic> insurancePersonData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/insurance-person/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(insurancePersonData),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to add insurance person');
    }
  }
    Future<InsurancePerson?> fetchInsurancePersonDetails() async {
    final response = await http.get(Uri.parse('$baseUrl/insurance-person-details'));
    
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return InsurancePerson.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch insurance person details');
    }
  }

  Future<Map<String, dynamic>> addInsuredFamilyMember(Map<String, dynamic> familyMemberData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/insured-family-member/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(familyMemberData),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to add insured family member');
    }
  }
}
