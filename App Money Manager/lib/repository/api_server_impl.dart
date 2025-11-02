import 'package:appmoneymanager/models/transaction.dart';
import 'package:dio/dio.dart';
import '../models/login.dart';
import 'api.dart';
import 'log.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiServerImpl implements Api {
  String baseUrl = "http://localhost:8080";
  late Dio dio;
  Log log;

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  ApiServerImpl(this.log) {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    //  Thêm interceptor để tự refresh token khi 401
    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, ErrorInterceptorHandler handler) async {
        if (e.response?.statusCode == 401) {
          final refreshed = await _refreshToken();
          if (refreshed) {
            // Gửi lại request ban đầu với token mới
            final token = await secureStorage.read(key: 'accessToken');
            e.requestOptions.headers['Authorization'] = 'Bearer $token';

            final retryResponse = await dio.fetch(e.requestOptions);
            return handler.resolve(retryResponse);
          }
        }
        return handler.next(e);
      },
    ));
  }

  // ✅ Gắn token
  Future<void> _attachToken() async {
    final accessToken = await secureStorage.read(key: 'accessToken');
    if (accessToken != null && accessToken.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $accessToken';
    }
  }

  // ✅ Login — lưu cả access và refresh token
  @override
  Future<bool> checkLogin(Login login) async {
    try {
      final response = await dio.post("/login", data: login.toMap());

      if (response.statusCode == 200) {
        final accessToken = response.data["accessToken"];
        final refreshToken = response.data["refreshToken"];

        if (accessToken != null && refreshToken != null) {
          await secureStorage.write(key: 'accessToken', value: accessToken);
          await secureStorage.write(key: 'refreshToken', value: refreshToken);

          dio.options.headers['Authorization'] = 'Bearer $accessToken';
        }

        print("Đăng nhập thành công");
        return true;
      } else {
        print("Lỗi server: ${response.statusCode}");
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print("Lỗi phía BE: ${e.response?.statusCode} ${e.response?.data}");
      } else {
        print("Lỗi kết nối hoặc timeout: ${e.message}");
      }
      return false;
    } catch (e) {
      print("Lỗi khác: $e");
      return false;
    }
  }

  // Refresh token khi access token hết hạn
  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await secureStorage.read(key: 'refreshToken');
      if (refreshToken == null) return false;

      final response = await dio.post("/refresh", data: {
        "refreshToken": refreshToken,
      });

      if (response.statusCode == 200) {
        final newAccessToken = response.data["accessToken"];
        final newRefreshToken = response.data["refreshToken"];

        await secureStorage.write(key: 'accessToken', value: newAccessToken);
        await secureStorage.write(key: 'refreshToken', value: newRefreshToken);

        dio.options.headers['Authorization'] = 'Bearer $newAccessToken';
        print("Token đã được refresh thành công");
        return true;
      } else {
        print("Không thể refresh token: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Lỗi khi refresh token: $e");
      return false;
    }
  }

  // ✅ Các API khác
  @override
  Future<void> addTransaction(Transaction transaction) async {
    await _attachToken();
    try {
      final response = await dio.post("/add", data: transaction.toMap());
      if (response.statusCode == 200) return;
      throw Exception("Server error: ${response.statusCode}");
    } catch (e) {
      throw Exception("Không thêm được giao dịch: $e");
    }
  }

  @override
  Future<void> deleteTransaction(String dateTime) async {
    await _attachToken();
    try {
      final response = await dio.delete("/remove", data: {"dateTime": dateTime});
      if (response.statusCode == 200) return;
      throw Exception("Server error: ${response.statusCode}");
    } catch (e) {
      throw Exception("Không thể xóa giao dịch: $e");
    }
  }

  @override
  Future<void> editTransaction(Transaction transaction) async {
    await _attachToken();
    try {
      final response = await dio.post("/edit", data: transaction.toMap());
      if (response.statusCode == 200) return;
      throw Exception("Server error: ${response.statusCode}");
    } catch (e) {
      throw Exception("Không thể sửa giao dịch: $e");
    }
  }

  @override
  Future<List<String>> getMonths() async {
    await _attachToken();
    try {
      final response = await dio.get("/get_months");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((e) => e.toString()).toList();
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Không lấy được danh sách tháng: $e");
    }
  }

  @override
  Future<double> getTotal() async {
    await _attachToken();
    try {
      final response = await dio.get("/total");
      if (response.statusCode == 200) {
        return double.parse(response.data.toString());
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Không lấy được tổng doanh thu: $e");
    }
  }

  @override
  Future<List<Transaction>> getTransaction(String month) async {
    await _attachToken();
    try {
      final response = await dio.get("/transaction", queryParameters: {"month": month});
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((e) => Transaction.fromMap(e)).toList();
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Không lấy được dữ liệu giao dịch: $e");
    }
  }
}
