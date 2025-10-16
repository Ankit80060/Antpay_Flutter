// // getAppTransactionDeta();
//     // getTransactionData(Get.context!);
//     // getAccountDetailsData();
//     getCardDetailsData();

//      Future<void> getAppTransactionDeta() async {
//     try {
//       isLoading.value = true;
//       TransactionHistoryRequestModel data = TransactionHistoryRequestModel(
//           mobile: SessionManager().getMobile(),
//           aParam: AppConstant.generateAuthParam(
//               SessionManager().getMobile().toString()));

//       final response = await _repository2.fetchAppTransactionDeta(
//         SessionManager().getToken().toString(),
//         AuthToken.getAuthToken(),
//         request: data,
//       );
//       print(response.toString());
//       if (response.status.toString() == '1') {
//         //   if (response.transaction_list != null) {
//         // List<TransactionHistorylist>? transactionList = response.transaction_list;
//         // for (TransactionHistorylist transaction in transactionList!) {
//         //   transactionlist?.add(transaction);
//         // }
//         // } else {
//         //   print('Transaction list is null');
//         // }
//       } else {
//         CustomToast.show(response.msg.toString());
//       }
//     } catch (e) {
//       print(e);
//       CustomToast.show(e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> getTransactionData(context) async {
//     try {
//       isLoading.value = true;
//       final args = ModalRoute.of(context)?.settings.arguments;

//       TransactionRequestModel data = TransactionRequestModel(
//         mobile: SessionManager().getMobile(),
//         transactionNo: args.toString(),
//         aParam: AppConstant.generateAuthParam(
//             SessionManager().getMobile().toString()),
//       );

//       final response = await _repository2.fetchTransactionDetails(
//         SessionManager().getToken().toString(),
//         AuthToken.getAuthToken(),
//         request: data,
//       );
//       print(response.toString());
//       if (response.status.toString() == '1') {
//       } else {
//         CustomToast.show(response.msg.toString());
//       }
//     } catch (e) {
//       print(e);
//       CustomToast.show(e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // account  details

//   Future<void> getAccountDetailsData() async {
//     try {
//       isLoading.value = true;
//       GetBankDetailsRequestModel data = GetBankDetailsRequestModel(
//           mobile: SessionManager().getMobile().toString(),
//           aParam: AppConstant.generateAuthParam(
//               SessionManager().getMobile().toString()));

//       final response = await _repository2.fetchAccountDetails(
//         SessionManager().getToken().toString(),
//         AuthToken.getAuthToken(),
//         request: data,
//       );
//       if (response.status.toString() == '1') {
//       } else {
//         CustomToast.show(response.msg.toString());
//       }
//     } catch (e) {
//       print(e);
//       CustomToast.show(e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//    Future<void> getCardDetailsData() async {
//     try {
//       isLoading.value = true;
//   //  FetchCardInfoRequestModel data = FetchCardInfoRequestModel(
//   //       p2: "E",
//   //       actionName: 'GETCARD',
//   //       p1: SessionManager().getMobile().toString(),
//   //         aParam: AppConstant.generateAuthParam(
//   //             SessionManager().getMobile().toString()));
//    WalletBalanceRequestModel data = WalletBalanceRequestModel(
//         actionName: 'WALLETBAL', p1: SessionManager().getMobile().toString(),aParam: AppConstant.generateAuthParam( SessionManager().getMobile().toString()));



//       final response = await _repository2.fetchWalletDetails(
//         SessionManager().getToken().toString(),
//         AuthToken.getAuthToken(),
//         request: data,
//       );
//       if (response.status.toString() == '1') {
//       } else {
//         CustomToast.show(response.msg.toString());
//       }
//     } catch (e) {
//       print(e);
//       CustomToast.show(e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//    }



// if(kycType.equals("FULL KYC")){

//                     if(currenType.equals("ATM Withdrawal")){
//                         if(perTxnLimit.getText().toString().isEmpty()){
//                             Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                         } else if (Integer.parseInt(perTxnLimit.getText().toString())>2000) {
//                             Toast.makeText(activity, "Cannot exceed per transaction limit", Toast.LENGTH_SHORT).show();
//                         } else if (dailyLimit.getText().toString().isEmpty()) {
//                             Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                         } else if (Integer.parseInt(dailyLimit.getText().toString())>10000) {
//                             Toast.makeText(activity, "Cannot exceed daily limit", Toast.LENGTH_SHORT).show();
//                         } else if (monthlyLimit.getText().toString().isEmpty()) {
//                             Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                         } else if (Integer.parseInt(monthlyLimit.getText().toString())>10000) {
//                             Toast.makeText(activity, "Cannot exceed monthly limit", Toast.LENGTH_SHORT).show();
//                         } else if(yearlyCount.getText().toString().isEmpty()){
//                             Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                         } else if (Integer.parseInt(yearlyCount.getText().toString())>300000) {
//                             Toast.makeText(activity, "Cannot exceed yearly limit", Toast.LENGTH_SHORT).show();
//                         } else if (limitUpdateId.equals("-1")) {
//                             Toast.makeText(activity, "Please select channel category", Toast.LENGTH_SHORT).show();
//                         }
//                         else {
//                             ApiInterfacePayU apiService = RetrofitClientPayU.getInstance(false).create(ApiInterfacePayU.class);
//                             UpdateCardLimitRequest UpdateCardLimitRequest = new UpdateCardLimitRequest();
//                             UpdateCardLimitRequest.setPerTxnLimit(perTxnLimit.getText().toString());
//                             UpdateCardLimitRequest.setDailyLimit(dailyLimit.getText().toString());
//                             UpdateCardLimitRequest.setMonthlyLimit(monthlyLimit.getText().toString());
//                             UpdateCardLimitRequest.setYearlyLimit(yearlyCount.getText().toString());
//                             UpdateCardLimitRequest.setId(limitUpdateId);
//                             Map<String, String> map = new HashMap<>();
//                             map.put("oath_token", sessionManager.getToken());
//                             map.put("Authorization", RetrofitBuilder.getAuthToken());
//                             Call<updateCardLimitResponse> call3 = apiService.updateCardLimit(map, UpdateCardLimitRequest);
//                             call3.enqueue(new Callback<updateCardLimitResponse>() {
//                                 @Override
//                                 public void onResponse(@NotNull Call<updateCardLimitResponse> call, @NotNull Response<updateCardLimitResponse> response) {
//                                     Toast.makeText(activity, "" + response.body().getResponseMessage(), Toast.LENGTH_SHORT).show();
//                                     //if we want to navigate back to home
// //                            if (getActivity() != null) {
// //                                getActivity().getSupportFragmentManager().popBackStackImmediate();
// //                            }
//                                 }

//                                 @Override
//                                 public void onFailure(@NotNull Call<updateCardLimitResponse> call, @NotNull Throwable t) {
//                                 }
//                             });
//                         }
//                     }
//                     else{
//                         if(perTxnLimit.getText().toString().isEmpty()){
//                             Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                         } else if (Integer.parseInt(perTxnLimit.getText().toString())>20000) {
//                             Toast.makeText(activity, "Cannot exceed per transaction limit", Toast.LENGTH_SHORT).show();
//                         } else if (dailyLimit.getText().toString().isEmpty()) {
//                             Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                         } else if (Integer.parseInt(dailyLimit.getText().toString())>100000) {
//                             Toast.makeText(activity, "Cannot exceed daily limit", Toast.LENGTH_SHORT).show();
//                         } else if (monthlyLimit.getText().toString().isEmpty()) {
//                             Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                         } else if (Integer.parseInt(monthlyLimit.getText().toString())>200000) {
//                             Toast.makeText(activity, "Cannot exceed monthly limit", Toast.LENGTH_SHORT).show();
//                         } else if(yearlyCount.getText().toString().isEmpty()){
//                             Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                         } else if (Integer.parseInt(yearlyCount.getText().toString())>300000) {
//                             Toast.makeText(activity, "Cannot exceed yearly limit", Toast.LENGTH_SHORT).show();
//                         } else if (limitUpdateId.equals("-1")) {
//                             Toast.makeText(activity, "Please select channel category", Toast.LENGTH_SHORT).show();
//                         }
//                         else {
//                             ApiInterfacePayU apiService = RetrofitClientPayU.getInstance(false).create(ApiInterfacePayU.class);
//                             UpdateCardLimitRequest UpdateCardLimitRequest = new UpdateCardLimitRequest();
//                             UpdateCardLimitRequest.setPerTxnLimit(perTxnLimit.getText().toString());
//                             UpdateCardLimitRequest.setDailyLimit(dailyLimit.getText().toString());
//                             UpdateCardLimitRequest.setMonthlyLimit(monthlyLimit.getText().toString());
//                             UpdateCardLimitRequest.setYearlyLimit(yearlyCount.getText().toString());
//                             UpdateCardLimitRequest.setId(limitUpdateId);
//                             Map<String, String> map = new HashMap<>();
//                             map.put("oath_token", sessionManager.getToken());
//                             map.put("Authorization", RetrofitBuilder.getAuthToken());
//                             Call<updateCardLimitResponse> call3 = apiService.updateCardLimit(map, UpdateCardLimitRequest);
//                             call3.enqueue(new Callback<updateCardLimitResponse>() {
//                                 @Override
//                                 public void onResponse(@NotNull Call<updateCardLimitResponse> call, @NotNull Response<updateCardLimitResponse> response) {
//                                     Toast.makeText(activity, "" + response.body().getResponseMessage(), Toast.LENGTH_SHORT).show();
//                                     //if we want to navigate back to home
// //                            if (getActivity() != null) {
// //                                getActivity().getSupportFragmentManager().popBackStackImmediate();
// //                            }
//                                 }

//                                 @Override
//                                 public void onFailure(@NotNull Call<updateCardLimitResponse> call, @NotNull Throwable t) {
//                                 }
//                             });
//                         }
//                     }

//                 }
//                 else{
//                     if(perTxnLimit.getText().toString().isEmpty()){
//                         Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                     } else if (Integer.parseInt(perTxnLimit.getText().toString())>10000) {
//                         Toast.makeText(activity, "Cannot exceed per transaction limit", Toast.LENGTH_SHORT).show();
//                     } else if (dailyLimit.getText().toString().isEmpty()) {
//                         Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                     } else if (Integer.parseInt(dailyLimit.getText().toString())>10000) {
//                         Toast.makeText(activity, "Cannot exceed daily limit", Toast.LENGTH_SHORT).show();
//                     } else if (monthlyLimit.getText().toString().isEmpty()) {
//                         Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                     } else if (Integer.parseInt(monthlyLimit.getText().toString())>10000) {
//                         Toast.makeText(activity, "Cannot exceed monthly limit", Toast.LENGTH_SHORT).show();
//                     } else if(yearlyCount.getText().toString().isEmpty()){
//                         Toast.makeText(activity, "All fields are mandatory", Toast.LENGTH_SHORT).show();
//                     } else if (Integer.parseInt(yearlyCount.getText().toString())>120000) {
//                         Toast.makeText(activity, "Cannot exceed yearly limit", Toast.LENGTH_SHORT).show();
//                     } else if (limitUpdateId.equals("-1")) {
//                         Toast.makeText(activity, "Please select channel category", Toast.LENGTH_SHORT).show();
//                     }
//                     else {
//                         ApiInterfacePayU apiService = RetrofitClientPayU.getInstance(false).create(ApiInterfacePayU.class);
//                         UpdateCardLimitRequest UpdateCardLimitRequest = new UpdateCardLimitRequest();
//                         UpdateCardLimitRequest.setPerTxnLimit(perTxnLimit.getText().toString());
//                         UpdateCardLimitRequest.setDailyLimit(dailyLimit.getText().toString());
//                         UpdateCardLimitRequest.setMonthlyLimit(monthlyLimit.getText().toString());
//                         UpdateCardLimitRequest.setYearlyLimit(yearlyCount.getText().toString());
//                         UpdateCardLimitRequest.setId(limitUpdateId);
//                         Map<String, String> map = new HashMap<>();
//                         map.put("oath_token", sessionManager.getToken());
//                         map.put("Authorization", RetrofitBuilder.getAuthToken());
//                         Call<updateCardLimitResponse> call3 = apiService.updateCardLimit(map, UpdateCardLimitRequest);
//                         call3.enqueue(new Callback<updateCardLimitResponse>() {
//                             @Override
//                             public void onResponse(@NotNull Call<updateCardLimitResponse> call, @NotNull Response<updateCardLimitResponse> response) {
//                                 Toast.makeText(activity, "" + response.body().getResponseMessage(), Toast.LENGTH_SHORT).show();
//                                 //if we want to navigate back to home
// //                            if (getActivity() != null) {
// //                                getActivity().getSupportFragmentManager().popBackStackImmediate();
// //                            }
//                             }

//                             @Override
//                             public void onFailure(@NotNull Call<updateCardLimitResponse> call, @NotNull Throwable t) {
//                             }
//                         });
//                     }
                // }

          