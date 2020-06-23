import 'package:flutter/material.dart';

import 'package:amap_map_fluttify/amap_map_fluttify.dart';

import 'package:permission_handler/permission_handler.dart';

class BaiduMap extends StatefulWidget {
  BaiduMap({Key key}) : super(key: key);

  @override
  _BaiduMapState createState() => _BaiduMapState();
}

class _BaiduMapState extends State<BaiduMap> {
  void inintMap() async {
    /// !!使用真机调试!!
    /// !注意: 只要是返回Future的方法, 一律使用`await`修饰, 确保当前方法执行完成后再执行下一行, 在不能使用`await`修饰的环境下, 在`then`方法中执行下一步.
    ///
    /// 初始化(0.17.0开始可以不用配置AndroidManifest.xml)
    /// !!但是你如果你使用了amap_search_fluttify或amap_location_fluttify, 那么仍旧需要在AndroidManifest.xml中配置key!
    /// AndroidManifest.xml配置key参考 https://lbs.amap.com/api/android-sdk/gettingstarted
    await enableFluttifyLog(false);
    await AmapService.init(
        iosKey: '27720658f878bee7d1e165298a1bd294',
        androidKey: '27720658f878bee7d1e165298a1bd294');

    /// 如果你觉得引擎的日志太多, 可以关闭Fluttify引擎的日志
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inintMap();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: AmapWidget(),
    );
  }
}

// Map<Permission, PermissionStatus> statues =
//     await [Permission.locationWhenInUse].request();
// print(statues.toString());
Future<bool> requestPermission() async {
  var status = await Permission.location.request();
  print(status);
  if (status == PermissionStatus.granted) {
    return true;
  } else {
    print('需要定位权限');
    openAppSettings();
    return false;
  }
}

class AmapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AmapView(
      // 地图类型 (可选)
      mapType: MapType.Standard,
      // 是否显示缩放控件 (可选)
      showZoomControl: true,
      // 是否显示指南针控件 (可选)
      showCompass: true,
      // 是否显示比例尺控件 (可选)
      showScaleControl: true,
      // 是否使能缩放手势 (可选)
      zoomGesturesEnabled: true,
      // 是否使能滚动手势 (可选)
      scrollGesturesEnabled: true,
      // 是否使能旋转手势 (可选)
      rotateGestureEnabled: true,
      // 是否使能倾斜手势 (可选)
      tiltGestureEnabled: true,
      // 缩放级别 (可选)
      zoomLevel: 18,
      // 中心点坐标 (可选)
      centerCoordinate: LatLng(39, 116),
      // 标记 (可选)
      markers: <MarkerOption>[],
      // 标识点击回调 (可选)
      onMarkerClicked: (Marker marker) {},
      // 地图点击回调 (可选)
      onMapClicked: (LatLng coord) {},
      // 地图拖动开始 (可选)
      onMapMoveStart: (MapMove move) {},
      // 地图拖动结束 (可选)
      onMapMoveEnd: (MapMove move) {},
      // 地图创建完成回调 (可选)
      onMapCreated: (controller) async {
        // requestPermission是权限请求方法, 需要你自己实现
        // 如果不知道怎么处理, 可以参考example工程的实现, example工程依赖了`permission_handler`插件.
        if (await requestPermission()) {
          await controller.showMyLocation(MyLocationOption(show: true));
        }
      },
    );
  }
}
