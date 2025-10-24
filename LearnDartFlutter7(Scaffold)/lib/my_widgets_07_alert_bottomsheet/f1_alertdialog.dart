import 'package:flutter/material.dart';

class F1AlertDialog extends StatelessWidget {
  const F1AlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialog Example'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ví dụ AlertDialog cơ bản
            ElevatedButton(
              onPressed: () => _showBasicAlert(context),
              child: const Text('Basic Alert'),
            ),
            const SizedBox(height: 20),
            
            // Ví dụ AlertDialog với nhiều nút
            ElevatedButton(
              onPressed: () => _showConfirmAlert(context),
              child: const Text('Confirm Alert'),
            ),
            const SizedBox(height: 20),
            
            // Ví dụ AlertDialog với input
            ElevatedButton(
              onPressed: () => _showInputAlert(context),
              child: const Text('Input Alert'),
            ),
          ],
        ),
      ),
    );
  }

  // AlertDialog cơ bản
  void _showBasicAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông báo'),
          content: const Text('Đây là một AlertDialog đơn giản!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // AlertDialog xác nhận
  void _showConfirmAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: const Text('Bạn có chắc chắn muốn xóa không?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã xóa!')),
                );
              },
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }

  // AlertDialog với input
  void _showInputAlert(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nhập tên'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Nhập tên của bạn',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Xin chào ${controller.text}!')),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
