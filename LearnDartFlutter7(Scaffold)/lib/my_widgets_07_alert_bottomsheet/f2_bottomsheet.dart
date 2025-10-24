import 'package:flutter/material.dart';

class F2BottomSheet extends StatelessWidget {
  const F2BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomSheet Example'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ví dụ BottomSheet cơ bản
            ElevatedButton(
              onPressed: () => _showBasicBottomSheet(context),
              child: const Text('Basic BottomSheet'),
            ),
            const SizedBox(height: 20),
            
            // Ví dụ BottomSheet với nhiều tùy chọn
            ElevatedButton(
              onPressed: () => _showActionBottomSheet(context),
              child: const Text('Action BottomSheet'),
            ),
            const SizedBox(height: 20),
            
            // Ví dụ BottomSheet với danh sách
            ElevatedButton(
              onPressed: () => _showListBottomSheet(context),
              child: const Text('List BottomSheet'),
            ),
            const SizedBox(height: 20),
            
            // Ví dụ BottomSheet có thể kéo
            ElevatedButton(
              onPressed: () => _showDraggableBottomSheet(context),
              child: const Text('Draggable BottomSheet'),
            ),
          ],
        ),
      ),
    );
  }

  // BottomSheet cơ bản
  void _showBasicBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'BottomSheet cơ bản',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Đây là một BottomSheet đơn giản!'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Đóng'),
              ),
            ],
          ),
        );
      },
    );
  }

  // BottomSheet với các hành động
  void _showActionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Chọn hành động',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Chia sẻ'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đã chọn: Chia sẻ')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.copy),
                title: const Text('Sao chép'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đã chọn: Sao chép')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Xóa'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đã chọn: Xóa')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // BottomSheet với danh sách
  void _showListBottomSheet(BuildContext context) {
    final List<String> items = [
      'Tùy chọn 1',
      'Tùy chọn 2',
      'Tùy chọn 3',
      'Tùy chọn 4',
      'Tùy chọn 5',
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Danh sách tùy chọn',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]),
                      onTap: () {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Đã chọn: ${items[index]}')),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // BottomSheet có thể kéo
  void _showDraggableBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  // Handle để kéo
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Mục ${index + 1}'),
                          subtitle: Text('Mô tả cho mục ${index + 1}'),
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
