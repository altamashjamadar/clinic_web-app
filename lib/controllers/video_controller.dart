import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController controller;
  var isInitialized = false.obs;
  var isPlaying = false.obs;

  VideoController(String videoAsset) {
    controller = VideoPlayerController.asset(videoAsset)
      ..initialize().then((_) {
        isInitialized.value = true;
        update();
      });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void togglePlayPause() {
    if (isPlaying.value) {
      controller.pause();
      isPlaying.value = false;
    } else {
      controller.play();
      isPlaying.value = true;
    }
    update();
  }

  void rewind() {
    final newPosition = controller.value.position - const Duration(seconds: 10);
    controller.seekTo(newPosition);
  }

  void forward() {
    final newPosition = controller.value.position + const Duration(seconds: 10);
    controller.seekTo(newPosition);
  }
}