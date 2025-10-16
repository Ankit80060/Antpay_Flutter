import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/model/notification/notification_model.dart';
import 'package:dio/dio.dart';

class NotificationRepo extends CommonApiRepo {
  Future<dynamic> getNotificationsApi(String oAuthToken, String auth,
      FetchNotificationRequestModel request) async {
    try {
      FetchNotificationResponseModel response =
          await apiClient.fetchNotifications(oAuthToken, auth, request);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error fetching notifications: $e");
    }
  }
}
