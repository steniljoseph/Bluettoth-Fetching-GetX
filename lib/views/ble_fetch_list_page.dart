// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/ble_list_controller.dart';
import 'ble_info.dart';

class BlePage extends StatelessWidget {
  SharedPreferences sharedPref;
  BlePage({super.key, required this.sharedPref});

  final BlePageController controller = Get.put(BlePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Founded Results"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              controller.refreshDevices();
            },
            child: const Text(
              'Refresh',
            ),
          ),
          Expanded(
            child: GetBuilder<BlePageController>(
              builder: (c) => ListView.separated(
                itemCount: controller.result.length,
                itemBuilder: (context, index) {
                  ScanResult results = controller.result[index];
                  final String deviceID = results.device.id.id;
                  bool redButton = sharedPref.getBool('$deviceID+RED') ?? false;
                  bool greenButton =
                      sharedPref.getBool('$deviceID+GREEN') ?? false;
                  return ListTile(
                    onTap: () {
                      Get.to(() => BleInfoPage(result: results));
                    },
                    title: Text(
                      results.device.name.isNotEmpty
                          ? results.device.name
                          : results.advertisementData.localName.isNotEmpty
                              ? results.advertisementData.localName
                              : 'Unknown',
                    ),
                    subtitle: Text(deviceID),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () {
                            redButton
                                ? sharedPref.setBool('$deviceID+RED', false)
                                : sharedPref.setBool('$deviceID+RED', true);
                            controller.update();
                          },
                          icon: Icon(
                            Icons.favorite,
                            color:
                                redButton ? Colors.red[900] : Colors.red[100],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            greenButton
                                ? sharedPref.setBool('$deviceID+GREEN', false)
                                : sharedPref.setBool('$deviceID+GREEN', true);
                            controller.update();
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: greenButton
                                ? Colors.green[900]
                                : Colors.green[100],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
