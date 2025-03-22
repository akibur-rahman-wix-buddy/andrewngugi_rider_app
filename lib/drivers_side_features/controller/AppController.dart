import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/driver_sign_updrop_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AppController extends GetxController {


  /// sign up first screen
  TextEditingController verifyPhoneNumber= TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();


  String ? selectedGender;
  XFile? avatar;

  /// sign up second screen controller
  Rx<int> vehicleTypeController = 0.obs;
  final colorController = DropdownButtonController();
  final manufacturerYearController = DropdownButtonController();
  final payloadCapacityController = DropdownButtonController();
  TextEditingController modelController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  String? carRegiNumber;
  List<XFile?> listOfImage = List.filled(3, null);
  final drivingExperienceController = DropdownButtonController();
  TextEditingController drivingLicence = TextEditingController();
  int termsAndCondition = 0;


  /// sign up fourth screen
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  /// update vehicle appController
  List<XFile?> updateListOfImage = List.filled(3, null);













}