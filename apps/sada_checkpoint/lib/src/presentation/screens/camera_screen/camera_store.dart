import 'package:camera/camera.dart';
import 'package:mobx/mobx.dart';

part 'camera_store.g.dart';

// ignore: library_private_types_in_public_api
class CameraStore = _CameraStoreBase with _$CameraStore;

abstract class _CameraStoreBase with Store {
  late final CameraController controller;
  late final Future<void> initializeControllerFuture;
  List<CameraDescription> cameras = [];
  @observable
  XFile? capturedImage;

  @action
  Future<void> init() async {
    cameras = await availableCameras();

    controller = CameraController(cameras.first, ResolutionPreset.high);
    initializeControllerFuture = controller.initialize();

    isCameraInitialized = true;
  }

  @observable
  bool isCameraInitialized = false;

  @action
  Future<void> takePicture() async {
    try {
      await initializeControllerFuture;
      capturedImage = await controller.takePicture();
    } catch (e) {
      rethrow;
    }
  }

  @action
  void resetPicture() {
    capturedImage = null;
  }
}
