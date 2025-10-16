import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_date_picker.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/place_model/city_model.dart';
import 'package:antpay_lite/model/place_model/state_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/views/miniAcc/controller/mini_account_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class MiniAccountFormView extends StatelessWidget {
  MiniAccountFormView({super.key});
  final miniAccountController = Get.put(MiniAccountController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
         Get.until((route) => Get.currentRoute == RoutesName.dashboard);

        return false;
      },
      child: MainScaffold(
        // resizeToAvoidBottomInset: true,
       
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 Image.asset(
                   'assets/images/profileicon1.png',
         width: 120,
                 ),
                Container(
                        margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                   
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                  child: Column(
                    children: [
                                 Image.asset(
                   'assets/images/profile_ant_hand.png',
             width: 120,
                 ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
                        child: Form(key: _formKey,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                      
                                  Text(
                                  'Mini Account',
                                  style: CustomStyles.black16600
                                ),
                                 Text(
                                  'Create your Mini Account',
                                  style: CustomStyles.black12300,
                                ),SizedBox(height: 5,),
                                  Text( "Mobile: ${SessionManager().getMobile()}",style: CustomStyles.black14500, ),
                                         const  SizedBox(height: 10,),
                               CustomTextField(
          controller: miniAccountController.aadhaarController,
          labelText: "Aadhar Number",
          hintText: 'Enter your Aadhaar No.',
          textInputType: TextInputType.number,
          inputformater: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(12),
          ],
          validator: (v) {
            if (v == null || v.isEmpty) {
              return "Enter Aadhaar Number";
            } else if (v.length != 12) {
              return "Aadhaar must be 12 digits";
            }
            return null;
          },
        ),
                          
                          
                           CustomTextField(
          controller: miniAccountController.panController,
          labelText: "PAN Number",
          hintText: 'Enter your PAN No.',
          textInputType: TextInputType.text,
          inputformater: [
            LengthLimitingTextInputFormatter(10),
          ],
          validator: (v) {
            if (v == null || v.isEmpty) {
              return "Enter PAN Number";
            } else if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(v)) {
              return "Enter valid PAN (e.g., ABCDE1234F)";
            }
            return null;
          },
        ),
                            CustomTextField(
          controller: miniAccountController.firstNameController,
          labelText: "First Name",
          hintText: 'Enter your First Name',
          textInputType: TextInputType.name,
          inputformater: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
            LengthLimitingTextInputFormatter(30),
          ],
          validator: (v) {
            if (v == null || v.isEmpty) {
              return "Enter First Name";
            }
            return null;
          },
        ),
                             CustomTextField(
          controller: miniAccountController.lastNameController,
          labelText: "Last Name",
          hintText: 'Enter your Last Name',
          textInputType: TextInputType.name,
         
        
        ),
                             CustomTextField(
          controller: miniAccountController.emailController,
          labelText: "Email",
          hintText: 'Enter your Email',
          textInputType: TextInputType.emailAddress,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return "Enter Email";
            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v)) {
              return "Enter valid Email";
            }
            return null;
          },
        ),
        CustomdatePicker(controller: miniAccountController.dobController,labelText: "Date of Birth",   firstDate: DateTime(
                              DateTime.now().year - 50,
                            ),
                            lastDate: DateTime.now(),),
    
        
       Obx(() => CustomDropdownFormField<String>(
      labelText: "Gender",
      hintText: "Select Gender",
      items: miniAccountController.genderList.map((g) {
      return DropdownMenuItem<String>(
        value: g,
        child: Text(g, style: CustomStyles.black12400),
      );
      }).toList(),
      selectedValue: miniAccountController.selectedGender.value.isEmpty
        ? null
        : miniAccountController.selectedGender.value,
      validator: (val) {
      if (val == null || val.isEmpty) {
        return "Please Select a Gender";
      }
      return null;
      },
      onChanged: (val) => miniAccountController.selectedGender.value = val!,
    )),
    
       
                                  CustomTextField(
          controller: miniAccountController.pincodeController,
          labelText: "Pincode",
          hintText: 'Enter your Pincode',
          textInputType: TextInputType.number,
          inputformater: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
          ],
          validator: (v) {
            if (v == null || v.isEmpty) {
              return "Enter Pincode";
            } else if (v.length != 6) {
              return "Pincode must be 6 digits";
            }
            return null;
          },
        ),
                        
                              
    Obx(() => CustomDropdownFormField<StateList>(
      labelText: "Select State",
      hintText: "Select State",
      selectedValue: miniAccountController.selectedState.value,
      items: miniAccountController.stateList.map((state) {
      return DropdownMenuItem<StateList>(
        value: state,
        child: Text(state.state ?? "NA",
            style: CustomStyles.black12400),
      );
      }).toList(),
      onChanged: (val) {
      miniAccountController.selectedState.value = val;
      miniAccountController.initCityList(val?.code);
      },
    validator: (val) => val == null ? "Please Select a State" : null,
    )),
    
    
                             Obx(() => CustomDropdownFormField<City>(
      labelText: "Select City",
    hintText: "Select City",
      selectedValue: miniAccountController.selectedCity.value,
      items: miniAccountController.cityList.map((city) {
      return DropdownMenuItem<City>(
        value: city,
        child: Text(city.cityName ?? "NA",
            style: CustomStyles.black12400),
      );
      }).toList(),
      onChanged: (val) {
      miniAccountController.selectedCity.value = val;
      },
      validator: (val) => val == null ? "Please Select a City" : null,
    )),
    
    Obx(() => CustomDropdownFormField<String>(
      labelText: "Occupation",
      hintText: "Select Occupation",
      items: miniAccountController.occupationList.map((v) {
      return DropdownMenuItem<String>(
        value: v,
        child: Text(v, style: CustomStyles.black12400),
      );
      }).toList(),
      selectedValue: miniAccountController.selectedOccupation.value,
      validator: (val) => val == null ? "Please Select an Occupation" : null,
      onChanged: (val) => miniAccountController.selectedOccupation.value = val,
    )),
    
    
    
      
       Obx(() => CustomDropdownFormField<String>(
      labelText: "Education",
      hintText: "Select Education",
      items: miniAccountController.educationList.map((edu) {
      return DropdownMenuItem<String>(
        value: edu,
        child: Text(edu, style: CustomStyles.black12400),
      );
      }).toList(),
      selectedValue: miniAccountController.selectedEducation.value,
      validator: (val) => val == null ? "Please Select Education" : null,
      onChanged: (val) => miniAccountController.selectedEducation.value = val,
    )),
    
    Obx(() => CustomDropdownFormField<String>(
      labelText: "Annual Income",
      hintText: "Select Annual Income",
      items: miniAccountController.annualIncomeList.map((income) {
      return DropdownMenuItem<String>(
        value: income,
        child: Text(income, style: CustomStyles.black12400),
      );
      }).toList(),
      selectedValue: miniAccountController.selectedAnnualIncome.value,
      validator: (val) => val == null ? "Please Select Annual Income" : null,
      onChanged: (val) => miniAccountController.selectedAnnualIncome.value = val,
    )),
    
      
                          
                             CustomTextField(
          controller: miniAccountController.addressController,
          maxLine: 5,
          labelText: "Address",
          hintText: 'Enter your Address as per PAN',
          textInputType: TextInputType.multiline,
          inputformater: [
            LengthLimitingTextInputFormatter(200),
          ],
          validator: (v) {
            if (v == null || v.isEmpty) {
              return "Enter Address";
            }
            return null;
          },
        ),
                                        const    SizedBox(height: 5,),
                                        RichText(
                                      text: TextSpan(
                                       text: "Disclaimer - ",
                                        style:CustomStyles.black13500,
                                        children: [
                                        
                                        TextSpan(
                                      text:
                                        "I hereby confirm that I have voluntarily submitted the copy of my Aadhaar card/e-Aadhaar/masked Aadhaar/Aadhaar XML to PayU Payment Private Limited. I further give my consent to PayU Payments to use my Aadhaar number and/or other information contained in the Aadhaar card (“Aadhaar Information”) to establish my identity for availing banking services. I have no objection for PayU to conduct offline verification of my Aadhaar Information or to share the same with UIDAI for facilitating Aadhaar based authentication and to obtain my demographic information. I have been informed by PayU/AntPay about other alternative options available for me to establish my identity.",
                                        style: CustomStyles.black12300
                                        ),
                                        ],
                                      ),
                                )
                                , const    SizedBox(height: 20,),
                           CustomElevatedButton(onPressed: ()async{
                               if (_formKey.currentState!.validate()) {
                                  await     miniAccountController.getFormData();   
                                          }
                           },text: "Proceed",)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
