import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/antpay_social/social_video_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../MainScaffold.dart';


class VideoPlayerScreen extends StatefulWidget {
  final String videoId;
  final List<YoutubeVideo> allVideos;

  const VideoPlayerScreen({
    super.key,
    required this.videoId,
    required this.allVideos,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter out current video
    final otherVideos = widget.allVideos
        .where((v) => YoutubePlayer.convertUrlToId(v.url) != widget.videoId)
        .toList();

    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (context, player) {
        return MainScaffold(
          body: Column(
            children: [
              player, 
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: otherVideos.length,
                  itemBuilder: (context, index) {
                    final video = otherVideos[index];
                    return    Card( surfaceTintColor: Colors.white,
                           elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(contentPadding: EdgeInsets.zero,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: CachedNetworkImage(
                              imageUrl: video.thumbnailImage,
                              width: 90,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(video.title,
                              style: CustomStyles.black13500),
                          onTap: () {
                            final newVideoId =
                                YoutubePlayer.convertUrlToId(video.url) ?? "";
                            setState(() {
                              _controller.load(newVideoId);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
