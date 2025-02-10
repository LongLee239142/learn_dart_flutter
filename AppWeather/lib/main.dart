import 'package:app_weather/page/my_app.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<Position?> _determinePosition() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Dịch vụ vị trí không được bật.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Quyền truy cập vị trí bị từ chối.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Quyền truy cập vị trí bị từ chối vĩnh viễn.');
    }

    return await Geolocator.getCurrentPosition();
  } catch (e) {
    print('Lỗi khi lấy vị trí: $e');
    return null;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 🔹 Sửa lỗi binding chưa khởi tạo

  Position? positionCurrent = await _determinePosition();

  runApp( MyApp(positionCurrent: positionCurrent,));

}
