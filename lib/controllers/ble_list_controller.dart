import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'homepage_controller.dart';

class BlePageController extends GetxController {
  late List<ScanResult> result;
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  bool _isScanning = false;

  final HomePageController c = Get.find();

  @override
  void onInit() {
    super.onInit();
    initBle();
    result = c.scanResultList;
  }

  void initBle() {
    flutterBlue.isScanning.listen((isScanning) {
      _isScanning = isScanning;
      update();
    });
  }

  refreshDevices() {
    if (!_isScanning) {
      flutterBlue.startScan(timeout: const Duration(seconds: 1));
      flutterBlue.scanResults.listen((scanResultList) {
        result = scanResultList;
      });
    } else {
      flutterBlue.stopScan();
    }
  }
}
