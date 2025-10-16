
import 'package:get/get.dart';

import '../../api/auth_token.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../model/investment/investment_response.dart';
import '../../prefrences/session_manager.dart';
import '../../repository/investment_repo/investment_repo.dart';

class InvestmentHomeController extends GetxController {

  InvestmentProductRepo repository = InvestmentProductRepo();
  RxBool isLoading = true.obs;
  RxList<InvestmentProduct> investmentProducts = <InvestmentProduct>[].obs;
 
    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInvestmentData();
  }

  void handelClickCard(int index) {
    // Handle card click logic here
  }

  Future<void> getInvestmentData() async {
    try {
     

      InvestmentResponse response = await repository.getInvestmentProduct(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken()
          );

      if (response.userData !=null) {
        investmentProducts.assignAll(response.userData!);
        
      } else {
 
        CustomToast.show("No Data Found");
      }
    } catch (e) {
      print("Error fetching investment data: $e");
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
 }


  
}