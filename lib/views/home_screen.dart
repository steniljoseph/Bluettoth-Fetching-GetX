// ignore_for_file: library_private_types_in_public_api

import 'package:ble_getx/controllers/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  final HomePageController _controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Bluetooth"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _controller.searchingBluetoothDevices(),
          child: const Text("Search"),
        ),
      ),
    );
  }
}
