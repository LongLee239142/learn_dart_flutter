import 'package:flutter/material.dart';

class F2PopScopeSimpleExample extends StatelessWidget {
  const F2PopScopeSimpleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopScope Simple Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopScope Simple Example'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PopScopePage(),
              ),
            );
          },
          child: const Text('Go to PopScope Page'),
        ),
      ),
    );
  }
}

class PopScopePage extends StatefulWidget {
  const PopScopePage({super.key});

  @override
  State<PopScopePage> createState() => _PopScopePageState();
}

class _PopScopePageState extends State<PopScopePage> {
  bool _canPop = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // canPop: false - không cho phép pop về màn hình trước
      // canPop: true - cho phép pop về màn hình trước
      canPop: _canPop,
      
      // onPopInvokedWithResult: được gọi khi người dùng cố gắng pop
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          // Hiển thị dialog xác nhận
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Xác nhận'),
              content: const Text('Bạn có chắc chắn muốn thoát không?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Hủy'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Thoát'),
                ),
              ],
            ),
          );
          
          if (shouldPop == true) {
            Navigator.of(context).pop();
          }
        }
      },
      
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PopScope Page'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'PopScope Widget Demo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              
              const Text(
                'PopScope là widget mới trong Flutter 3.12+ thay thế cho WillPopScope.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              
              const Text(
                'Các thuộc tính chính:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              
              const Text(
                '• canPop: bool - Xác định có thể pop hay không\n'
                '• onPopInvokedWithResult: Callback - Được gọi khi cố gắng pop\n'
                '• child: Widget - Widget con',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 30),
              
              SwitchListTile(
                title: const Text('Cho phép Pop'),
                subtitle: const Text('Bật/tắt để thay đổi canPop'),
                value: _canPop,
                onChanged: (value) {
                  setState(() {
                    _canPop = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              
              Text(
                _canPop 
                  ? '✅ Có thể pop về màn hình trước'
                  : '❌ Không thể pop về màn hình trước',
                style: TextStyle(
                  fontSize: 16,
                  color: _canPop ? Colors.green : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              
              const Text(
                'Thử nhấn nút Back hoặc vuốt để quay lại!',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
