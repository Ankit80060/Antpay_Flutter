import 'dart:convert';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/model/antpay_social/antpay_social_model.dart';
import 'package:antpay_lite/model/antpay_social/blog_model.dart';
import 'package:antpay_lite/model/antpay_social/social_video_model.dart';
import 'package:antpay_lite/model/offer/game_zone_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AntpaySocialController extends GetxController {
  final CommonApiRepo repoClass = CommonApiRepo();

  final tabs = ["Latest News", "Games", "Videos", "Blog"];
  var selectedIndex = 0.obs;

  var isLoading = false.obs;

  var antpaysociallist = <AntpaySocialNewsItem>[].obs;
  var gamezonebannerList = <GameZoneData>[].obs;
  var videoList = <YoutubeVideo>[].obs;
  var blogList = <BlogsDatum>[].obs;

  Rx<YoutubePlayerController?> playerController =
      Rx<YoutubePlayerController?>(null);

  var newsLoaded = false.obs;
  var gamesLoaded = false.obs;
  var videosLoaded = false.obs;
  var blogsLoaded = false.obs;

  Future<void> getAntpaySocialNews() async {
    if (newsLoaded.value) return;
    try {
      isLoading.value = true;
      final response = await repoClass.apiClient.getAntpaySocialNews();
      if (response.status.toString() == "1") {
        antpaysociallist.assignAll(response.list);
        newsLoaded.value = true;
      } else {
        antpaysociallist.clear();
      }
    } catch (e) {
      antpaysociallist.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getGameZoneBanner() async {
    if (gamesLoaded.value) return;
    try {
      isLoading.value = true;
      final response = await repoClass.apiClient.gameZoneBanner();
      if (response.status.toString() == "1") {
        gamezonebannerList.assignAll(response.data);
        gamesLoaded.value = true;
      } else {
        gamezonebannerList.clear();
      }
    } catch (e) {
      gamezonebannerList.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAntpaySocialVideos() async {
    if (videosLoaded.value) return;
    try {
      isLoading.value = true;
      final response = await repoClass.apiClient.getAntpaySocialVideos();
      if (response.status.toString() == "1") {
        videoList.assignAll(response.videoList ?? []);
        videosLoaded.value = true;

        if (response.singleVideo != null) {
          final videoId =
              YoutubePlayer.convertUrlToId(response.singleVideo!.url);
          if (videoId != null) {
            playerController.value = YoutubePlayerController(
              initialVideoId: videoId,
              flags: const YoutubePlayerFlags(autoPlay: false),
            );
          }
        }
      } else {
        videoList.clear();
      }
    } catch (e) {
      videoList.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getBlogsList() async {
    if (blogsLoaded.value) return;
    try {
      isLoading.value = true;
      final request =
          BlogRequest(mobile: SessionManager().getMobile().toString());
      final responseRaw = await repoClass.apiClient.getBlogsData(request);
      Map<String, dynamic> jsonData = responseRaw is String
          ? jsonDecode(responseRaw)
          : responseRaw as Map<String, dynamic>;

      final model = BlogModel.fromJson(jsonData);
      if (model.status == "1") {
        blogList.assignAll(model.blogsData ?? []);
        blogsLoaded.value = true;
      } else {
        blogList.clear();
      }
    } catch (e) {
      blogList.clear();
    } finally {
      isLoading.value = false;
    }

  }

  @override
  void onInit() {
    super.onInit();

    loadDataForTab(0);
  }

  Future<void> loadDataForTab(int index) async {
    selectedIndex.value = index; 

    switch (index) {
      case 0:
        await getAntpaySocialNews();
        break;
      case 1:
        await getGameZoneBanner();
        break;
      case 2:
        await getAntpaySocialVideos();
        break;
      case 3:
        await getBlogsList();
        break;
    }
  }
}
