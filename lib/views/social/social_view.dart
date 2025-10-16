import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/custom_url_launcher.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/antpay_social/blog_model.dart';
import 'package:antpay_lite/viewmodels/antpay_socialnews_controller/antpay_socialnews_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../MainScaffold.dart';
import 'youtube_play_video_view.dart';

class SocialView extends StatelessWidget {
  int? index;
  SocialView({Key? key,this.index}) : super(key: key);

  final AntpaySocialController antpaySocialController =
      Get.put(AntpaySocialController());

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
    
        if (antpaySocialController.selectedIndex.value != 0) {
            await antpaySocialController.loadDataForTab(0);
    return false;
        }
      
        return true;
      },
      child: Scaffold(
   
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
Obx(() => Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black12,width: 1),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      _buildTabBox(0),
      _buildTabBox(1),
      _buildTabBox(2),
      _buildTabBox(3),
    ],
  ),
))


,

    
              const SizedBox(height: 10),
    
              Obx(() {
                if (antpaySocialController.isLoading.value) {
                  return const Expanded(
                    child: Center(child: Customloader()),
                  );
                }
    
                switch (antpaySocialController.selectedIndex.value) {
                  case 0:
                    return Expanded(
                      child: antpaySocialController.antpaysociallist.isEmpty
                          ? Center(
                              child: Text(
                              'No news available',
                              style: CustomStyles.black14500,
                            ))
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount:
                                  antpaySocialController.antpaysociallist.length,
                              itemBuilder: (context, index) {
                                final item = antpaySocialController
                                    .antpaysociallist[index];
                                return GestureDetector(
                                  onTap: () =>
                                      CustomUrlLauncher.openUrl(item.url),
                                  child: Card(
                                    surfaceTintColor: Colors.white,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                          color: Colors.grey.shade300, width: 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: CachedNetworkImage(
                                                imageUrl: item.img,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child: Customloader()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Container(
                                                  color: Colors.grey.shade300,
                                                  alignment: Alignment.center,
                                                  child: const Icon(
                                                      Icons.broken_image,
                                                      color: Colors.grey,
                                                      size: 40),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.title,
                                                  style: CustomStyles.black12600,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        item.website,
                                                        style: CustomStyles
                                                            .black10400,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      item.createdAt,
                                                      style:
                                                          CustomStyles.black10400,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    );
    
                  case 1:
                    return Expanded(
                      child: antpaySocialController.gamezonebannerList.isEmpty
                          ? Center(
                              child: Text(
                              'No games available',
                              style: CustomStyles.black14500,
                            ))
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: antpaySocialController
                                  .gamezonebannerList.length,
                              itemBuilder: (context, index) {
                                final item = antpaySocialController
                                    .gamezonebannerList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: GestureDetector(
                                    onTap: () => CustomUrlLauncher.openUrl(
                                        "https://10114.play.gamezop.com/"),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: item.banner ?? '',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const Center(child: Customloader()),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    );
    
                  case 2:
                    return Expanded(
                      child: antpaySocialController.videoList.isEmpty
                          ? Center(
                              child: Text(
                              'No videos available',
                              style: CustomStyles.black14500,
                            ))
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: antpaySocialController.videoList.length,
                              itemBuilder: (context, index) {
                                final video =
                                    antpaySocialController.videoList[index];
                                return Card(
                                  surfaceTintColor: Colors.white,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                        color: Colors.grey.shade300, width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        final videoId =
                                            YoutubePlayer.convertUrlToId(
                                                    video.url) ??
                                                "";
                                        antpaySocialController
                                            .playerController.value
                                            ?.load(videoId);
                                        Get.to(() => VideoPlayerScreen(
                                              videoId: videoId,
                                              allVideos: antpaySocialController
                                                  .videoList,
                                            ));
                                      },
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl: video.thumbnailImage,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child: Customloader()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                color: Colors.grey.shade300,
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                    Icons.broken_image,
                                                    size: 60,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            video.title,
                                            style: CustomStyles.black13500,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    );
    
                  case 3:
                    return Expanded(
                      child: antpaySocialController.blogList.isEmpty
                          ? Center(
                              child: Text(
                              'No blogs available',
                              style: CustomStyles.black14500,
                            ))
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: antpaySocialController.blogList.length,
                              itemBuilder: (context, index) {
                                final blogItem =
                                    antpaySocialController.blogList[index];
                                return Card(
                                  surfaceTintColor: Colors.white,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                        color: Colors.grey.shade300, width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: GestureDetector(
                                      onTap: () => Get.to(
                                          () => BlogDetailScreen(blog: blogItem)),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  blogItem.blogFeturedImage ?? "",
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child: Customloader()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                color: Colors.grey.shade300,
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                    Icons.broken_image,
                                                    size: 60,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            blogItem.postTitle ?? "",
                                            style: CustomStyles.black12600,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    );
    
                  default:
                    return const SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
Widget _buildTabBox(int index) {
  final controller = Get.find<AntpaySocialController>();
  final isSelected = controller.selectedIndex.value == index;

  return GestureDetector(
    onTap: () {
      if (!isSelected) {
        controller.selectedIndex.value = index;
        controller.loadDataForTab(index);
      }
    },
    child: Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? CustomStyles.bgcolor : Colors.white,
        border: Border.all(
          color: Colors.black12,width: .5
        ),
      ),
      child: Center(
        child: Text(
          controller.tabs[index],
          textAlign: TextAlign.center,
          style: isSelected
              ? CustomStyles.black12600
              : CustomStyles.black12400,
        ),
      ),
    ),
  );
}



}

class BlogDetailScreen extends StatelessWidget {
  final BlogsDatum blog;

  const BlogDetailScreen({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: blog.blogFeturedImage ?? "",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.broken_image,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(blog.postTitle ?? "", style: CustomStyles.black16600),
              const SizedBox(height: 10),
              Html(
                data: blog.postContent ?? "",
                style: {
                  "body": Style(
                    margin: Margins.zero,
                    padding: HtmlPaddings.zero,
                    fontSize: FontSize(12),
                    lineHeight: LineHeight(1.4),
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  "p": Style(
                    margin: Margins.only(bottom: 10),
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                  ),
                  "ul": Style(
                    margin: Margins.only(left: 16, bottom: 8),
                    padding: HtmlPaddings.zero,
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  "li": Style(
                    margin: Margins.only(bottom: 4),
                    fontSize: FontSize(12),
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  "a": Style(
                    color: Colors.red,
                    textDecoration: TextDecoration.underline,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  "strong": Style(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                },
                onLinkTap: (url, _, __) async {
                  if (url != null) {
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
