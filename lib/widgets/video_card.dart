import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/video_controller.dart';
import 'package:video_player/video_player.dart';
class VideoCard extends StatelessWidget {
  final String videoAsset;
  final String title;

  const VideoCard({
    super.key,
    required this.videoAsset,
    this.title = 'Clinic Video',
  });

  @override
  Widget build(BuildContext context) {
    final VideoController controller = Get.put(VideoController(videoAsset), tag: videoAsset);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Video Title
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),

          // Video Player Container
          LayoutBuilder(
            builder: (context, constraints) {
              return Obx(
                () => ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: controller.isInitialized.value
                      ? Container(
                          constraints: BoxConstraints(
                            maxHeight: constraints.maxWidth * 0.5625, // 16:9 aspect ratio
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              VideoPlayer(controller.controller),
                              Positioned(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.togglePlayPause();
                                    // Get.snackbar(
                                    //   'Video',
                                    //   controller.isPlaying.value ? 'Video playing' : 'Video paused',
                                    //   snackPosition: SnackPosition.TOP,
                                    // );
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black54,
                                    child: Icon(
                                      controller.isPlaying.value
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: constraints.maxWidth * 0.5625,
                          color: Colors.grey[300],
                          child: const Center(child: CircularProgressIndicator()),
                        ),
                ),
              );
            },
          ),

          // Video Controls
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10),
                  onPressed: () {
                    controller.rewind();
                    Get.snackbar('Video', 'Rewinded 10 seconds',
                        snackPosition: SnackPosition.TOP);
                  },
                ),
                Obx(
                  () => IconButton(
                    icon: Icon(
                      controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: () {
                      controller.togglePlayPause();
                      Get.snackbar(
                        'Video',
                        controller.isPlaying.value ? 'Video playing' : 'Video paused',
                        snackPosition: SnackPosition.TOP,
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.forward_10),
                  onPressed: () {
                    controller.forward();
                    Get.snackbar('Video', 'Forwarded 10 seconds',
                        snackPosition: SnackPosition.TOP);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}