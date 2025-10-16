import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../api/auth_token.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../model/billpay/FetchBillBean.dart';
import '../../model/billpay/getOperator.dart';
import '../../prefrences/session_manager.dart';
import '../../repository/billpay_repository/billpay_repo.dart';
import '../../utils/app_constant.dart';
import '../../utils/common_utils.dart';
import '../../utils/routes/routes_name.dart';
import '../../model/billpay/getBillers.dart';

class PostPaidController extends GetxController {
  BillPayRepo repository = BillPayRepo();

  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxList<ServiceResultModel> billerServiceData = <ServiceResultModel>[].obs;

 var billerOperatorData = Rx<OperatorResponse?>(null);
  

  var billerController = ''.obs;

  var numberController = TextEditingController();

  var loading = false.obs;
  var visible = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBillerList();
  }

   @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
 if (Get.isRegistered<PostPaidController>()) {
      Get.delete<PostPaidController>();
    }
    numberController.dispose();
    
  }

  Future<void> fetchBillerList() async {
    isLoading.value=true;
    try {
      BillersServiceReqModel data =
          BillersServiceReqModel(Service_Name: 'PostPaid');
      GetBillersServiceRes response = await repository.fetchBillerServiceName(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
          data);

        if (response.results !=null && response.results!.isNotEmpty) {
          billerServiceData.assignAll(response.results!);
        
      } else {
        billerServiceData.clear();
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOperatorName(String operatorCode, String operatorName) async {
    

    try {
     final data = getOperatorRequestModel(
      aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString()),
      Operator_Code: operatorCode.toString(),
      // Number_Tag: numberTag,
    );
      OperatorResponse response = await repository.fetchOperatordetails(
          AuthToken.getAuthToken(),
          SessionManager().getToken().toString(),

          data);

      if (response.status.toString() == '1') {
          billerOperatorData.value= response;
      } else {
        billerOperatorData.value=null;
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }

    // SessionManager().addNumber_Tag(operator.Number_Tag ?? '');
    // SessionManager().addOperator_Name(operator.Operator_Code ?? '');

  }


  
  Future<void> fetchBillerDetails() async {

    if (billerOperatorData.value==null) {
      CustomToast.show("Please select biller");
      return;
    }

    
     if (!(formKey.currentState?.validate() ?? false)) {
    return;
  }

    try {
     isLoading.value = true;
      final data = FetchBillRequestModel(
        Operator_Code: billerOperatorData.value!.operatorCode,
        number: numberController.text,
      );
      FetchBillBean response = await repository.fetchBillerServiceDetails(
          AuthToken.getAuthToken(),
          SessionManager().getToken().toString(),

          data);

      if (response.status.toString() == '1') {
        SessionManager.storePostPaidRetriveData(response.addinfo!);

        Get.toNamed(RoutesName.postPaidTableDetailsPage);

        
       
        
      } else {
        CustomToast.show(response.errormsg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }



  }


  void handelBillerSellection(ServiceResultModel selection) {

    getOperatorName(selection.Operator_Code!,selection.Operator_Name!);
  }

   String? getServiceType() {
    return SessionManager().getServiceType();
  }

  String? checkVaklidation(String? value) {

    if (value == null || value.isEmpty) {
      return "Please enter ${billerOperatorData.value?.numberTag ?? 'number'}";
    }
    if (value.length != 10) {
      return "Number must be 10 digits";
    }
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
      return "Enter a valid mobile number";
    }
    return null;
  
  }

  
}
