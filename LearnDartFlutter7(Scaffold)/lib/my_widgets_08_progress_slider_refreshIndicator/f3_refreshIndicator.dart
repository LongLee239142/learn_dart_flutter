import 'package:flutter/material.dart';

class F3RefreshIndicator extends StatefulWidget {
  const F3RefreshIndicator({super.key});

  @override
  State<F3RefreshIndicator> createState() => _F3RefreshIndicatorState();
}

class _F3RefreshIndicatorState extends State<F3RefreshIndicator> {
  List<String> _items = [];
  bool _isLoading = false;
  int _refreshCount = 0;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() {
    _items = List.generate(10, (index) => 'Item ${index + 1}');
  }

  Future<void> _refreshData() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _refreshCount++;
      _items = List.generate(15, (index) => 'Refreshed Item ${index + 1} (Refresh #$_refreshCount)');
      _isLoading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data refreshed! (Refresh #$_refreshCount)'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  Future<void> _loadMoreData() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      int currentLength = _items.length;
      _items.addAll(List.generate(5, (index) => 'New Item ${currentLength + index + 1}'));
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator Examples'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _refreshData,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          // Basic RefreshIndicator
          Expanded(
            flex: 1,
            child: _buildBasicRefreshIndicator(),
          ),
          
          const Divider(),
          
          // Custom RefreshIndicator
          Expanded(
            flex: 1,
            child: _buildCustomRefreshIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicRefreshIndicator() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Basic RefreshIndicator',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshData,
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Text('${index + 1}'),
                      ),
                      title: Text(_items[index]),
                      subtitle: Text('Pull down to refresh'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomRefreshIndicator() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Custom RefreshIndicator',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshData,
              color: Colors.white,
              backgroundColor: Colors.indigo,
              strokeWidth: 3,
              displacement: 40,
              child: ListView.builder(
                itemCount: _items.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == _items.length) {
                    return _buildLoadingIndicator();
                  }
                  
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getRandomColor(index),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        _items[index],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text('Custom refresh indicator'),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Selected: $value')),
                          );
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                          const PopupMenuItem(
                            value: 'share',
                            child: Text('Share'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 16),
            Text('Loading more items...'),
          ],
        ),
      ),
    );
  }

  Color _getRandomColor(int index) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.amber,
    ];
    return colors[index % colors.length];
  }
}

// Example with GridView
class F3RefreshIndicatorGridView extends StatefulWidget {
  const F3RefreshIndicatorGridView({super.key});

  @override
  State<F3RefreshIndicatorGridView> createState() => _F3RefreshIndicatorGridViewState();
}

class _F3RefreshIndicatorGridViewState extends State<F3RefreshIndicatorGridView> {
  List<Map<String, dynamic>> _photos = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadPhotos();
  }

  Future<void> _loadPhotos() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _photos = List.generate(20, (index) => {
        'id': index + 1,
        'title': 'Photo ${index + 1}',
        'color': _getRandomColor(index),
        'likes': (index * 7) % 100,
      });
      _isLoading = false;
    });
  }

  Color _getRandomColor(int index) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.amber,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator with GridView'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: _loadPhotos,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemCount: _photos.length,
                itemBuilder: (context, index) {
                  final photo = _photos[index];
                  return Card(
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: photo['color'],
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.photo,
                                size: 50,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                photo['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.favorite, size: 16, color: Colors.red),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${photo['likes']}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}


