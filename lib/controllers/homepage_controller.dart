import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/ble_fetch_list_page.dart';

class HomePageController extends GetxController {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  List<ScanResult> scanResultList = [];
  bool _isScanning = false;

  @override
  void onInit() {
    super.onInit();
    initBle();
    scan();
  }

  void initBle() {
    flutterBlue.isScanning.listen((isScanning) {
      _isScanning = isScanning;
    });
  }

  scan() async {
    if (!_isScanning) {
      flutterBlue.startScan(timeout: const Duration(seconds: 3));
      flutterBlue.scanResults.listen((results) {
        scanResultList = results;
      });
    } else {
      flutterBlue.stopScan();
    }
  }

  searchingBluetoothDevices() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    Get.bottomSheet(
      const Center(
        child: CircularProgressIndicator(),
      ),
      backgroundColor: Colors.white,
    );

    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        return Get.off(
          () => BlePage(
            sharedPref: sharedPref,
          ),
        );
      },
    );
  }
}
