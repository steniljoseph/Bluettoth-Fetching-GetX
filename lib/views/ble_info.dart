import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleInfoPage extends StatelessWidget {
  final ScanResult result;
  const BleInfoPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          result.device.name.isNotEmpty
              ? result.device.name
              : result.advertisementData.localName.isNotEmpty
                  ? result.advertisementData.localName
                  : 'Unknown',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(width: 0.5, color: Colors.blue),
          children: [
            TableRow(
              children: [
                const Text(
                  "\nDevice Name \n",
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
                Text(
                  result.device.name.isNotEmpty
                      ? result.device.name
                      : result.advertisementData.localName.isNotEmpty
                          ? result.advertisementData.localName
                          : 'Unknown',
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            TableRow(
              children: [
                const Text(
                  "\nDevice Address \n",
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
                Text(
                  result.device.id.id,
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            TableRow(
              children: [
                const Text(
                  "\nDevice Type \n",
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
                Text(
                  result.device.type.name,
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            TableRow(
              children: [
                const Text(
                  "\nDevice Signal \n",
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
                Text(
                  result.rssi.toString(),
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            TableRow(
              children: [
                const Text(
                  "\nConnectable \n",
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
                Text(
                  result.advertisementData.connectable.toString(),
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            TableRow(
              children: [
                const Text(
                  "\nTime Stamp \n",
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
                Text(
                  result.timeStamp.toString(),
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            TableRow(
              children: [
                const Text(
                  "\nManufacturer Data \n",
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
                Text(
                  result.advertisementData.manufacturerData.toString(),
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const kHeight = SizedBox(
  height: 10,
);
