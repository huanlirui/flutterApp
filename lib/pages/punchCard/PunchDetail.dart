import 'package:flutter/material.dart';
// import 'package:myapp/components/BaiduMap.dart';
import 'package:flutter_blue/flutter_blue.dart';

class PunchDetail extends StatefulWidget {
  final Map arguments;
  PunchDetail({Key key, this.arguments}) : super(key: key);

  @override
  _PunchDetailState createState() =>
      _PunchDetailState(arguments: this.arguments);
}

class _PunchDetailState extends State<PunchDetail> {
  Map arguments;
  _PunchDetailState({this.arguments});
  FlutterBlue flutterBlue = FlutterBlue.instance;

  bool isBleOn;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));
// Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });
// Stop scanning
    flutterBlue.stopScan();

    print(arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("打卡详情页"),
      ),
      body: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return Container(
                child: Column(
                  children: <Widget>[
                    // BaiduMap(),
                    Container(
                        child: Center(
                      child: Image.asset(
                        'images/face.gif',
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ))
                  ],
                ),
                padding: EdgeInsets.all(10),
              );
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key key, this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              'Bluetooth Adapter is ${state != null ? state.toString().substring(15) : 'not available'}.',
              style: TextStyle(color: Colors.white),
            ),
              Text(
              '请您开启蓝牙',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
