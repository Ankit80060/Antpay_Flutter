

import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:dio/dio.dart';
import '../../../model/offer/offer_details_by_category_model.dart';
import '../../../model/offer/offer_details_model.dart';
import '../../../model/offer/offers_model.dart';
import '../../../model/walletservice/announcement_model.dart';

class BannerApiRepo extends CommonApiRepo {
  Future<dynamic> getAntPayOffers() async {
    try {
      OfferResponse response = await apiClient.getOffers();

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
  Future<dynamic> getAnnouncementsData( oAuthToken, authToken,request
      ) async {
    try {
      AnnouncementResponseModel response =
          await apiClient.getAnnouncements(
             oAuthToken.trim(),
        authToken.trim(),
        request,
          );

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
  

  Future<dynamic> getOfferdetails(OfferDetailsRequest data) async {
    try {
      OfferDetailsResponse response = await apiClient.fetchOfferDetails(data);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<dynamic> getOffersbycategory(
    
      OfferDetailsByCategoryRequest  data
      ) async {
    try {
      var response =
          await apiClient.fetchOfferByCategory( data);

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Unknown API error");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
