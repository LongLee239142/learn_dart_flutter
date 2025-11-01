import 'package:appmoneymanager/models/transaction.dart';
import 'package:dio/dio.dart';
import '../models/login.dart';
import 'api.dart';
import 'log.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServerImpl implements Api {
  String baseUrl = "http://localhost:8080";
  late Dio dio;
  Log log;

  ApiServerImpl(this.log) {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    ));
  }

  Future<void> _attachToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    if (token != null && token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  @override
  Future<bool> checkLogin(Login login) async {
    try {
      Response response = await dio.post(
        "/login",
        data: login.toMap(),
      );

      if (response.statusCode == 200) {
        final token = response.data["token"];
        if (token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('accessToken', token);

          dio.options.headers['Authorization'] = 'Bearer $token';
        }

        print("✅ Đăng nhập thành công");
        return true;
      } else {
        print("⚠️ Lỗi server: ${response.statusCode}");
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print("❌ Lỗi phía BE: ${e.response?.statusCode} ${e.response?.data}");
      } else {
        print("❌ Lỗi kết nối hoặc timeout: ${e.message}");
      }
      return false;
    } catch (e) {
      print("❌ Lỗi khác: $e");
      return false;
    }
  }

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
