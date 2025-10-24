import 'package:flutter/material.dart';

// 1. PageView cơ bản với các trang màu sắc
class BasicPageViewDemo extends StatefulWidget {
  const BasicPageViewDemo({super.key});

  @override
  State<BasicPageViewDemo> createState() => _BasicPageViewDemoState();
}

class _BasicPageViewDemoState extends State<BasicPageViewDemo> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

  final List<String> _titles = [
    'Trang Đỏ',
    'Trang Xanh Lá',
    'Trang Xanh Dương',
    'Trang Cam',
    'Trang Tím',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Cơ Bản'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Hiển thị số trang hiện tại
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Trang ${_currentPage + 1} / ${_colors.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // PageView chính
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _colors.length,
              itemBuilder: (context, index) {
                return Container(
                  color: _colors[index],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.circle, size: 100, color: Colors.white),
                        const SizedBox(height: 20),
                        Text(
                          _titles[index],
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Vuốt sang trái/phải để chuyển trang',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Dots indicator
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_colors.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.indigo : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. PageView với ảnh và text
class ImagePageViewDemo extends StatefulWidget {
  const ImagePageViewDemo({super.key});

  @override
  State<ImagePageViewDemo> createState() => _ImagePageViewDemoState();
}

class _ImagePageViewDemoState extends State<ImagePageViewDemo> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Thiên Nhiên',
      'subtitle': 'Khám phá vẻ đẹp thiên nhiên',
      'icon': Icons.nature,
      'color': Colors.green,
    },
    {
      'title': 'Thành Phố',
      'subtitle': 'Cuộc sống hiện đại',
      'icon': Icons.location_city,
      'color': Colors.blue,
    },
    {
      'title': 'Du Lịch',
      'subtitle': 'Khám phá thế giới',
      'icon': Icons.travel_explore,
      'color': Colors.orange,
    },
    {
      'title': 'Công Nghệ',
      'subtitle': 'Tương lai trong tay bạn',
      'icon': Icons.phone_android,
      'color': Colors.purple,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView với Ảnh'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          final page = _pages[index];
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  page['color'].withOpacity(0.8),
                  page['color'].withOpacity(0.4),
                ],
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(page['icon'], size: 120, color: Colors.white),
                    const SizedBox(height: 30),
                    Text(
                      page['title'],
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      page['subtitle'],
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    // Nút Next/Previous
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (_currentPage > 0)
                          ElevatedButton.icon(
                            onPressed: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('Trước'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: page['color'],
                            ),
                          ),
                        if (_currentPage < _pages.length - 1)
                          ElevatedButton.icon(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text('Tiếp'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: page['color'],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_pages.length, (index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 20 : 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.teal : Colors.grey,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// 3. PageView với animation và hiệu ứng
class AnimatedPageViewDemo extends StatefulWidget {
  const AnimatedPageViewDemo({super.key});

  @override
  State<AnimatedPageViewDemo> createState() => _AnimatedPageViewDemoState();
}

class _AnimatedPageViewDemoState extends State<AnimatedPageViewDemo>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<String> _quotes = [
    "Học hỏi là kho báu vô tận",
    "Thành công đến từ sự kiên trì",
    "Ước mơ là điểm khởi đầu của mọi thành tựu",
    "Hôm nay là món quà, đó là lý do gọi là hiện tại",
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView với Animation'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
          _animationController.reset();
          _animationController.forward();
        },
        itemCount: _quotes.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.withOpacity(0.8),
                  Colors.purple.withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: Transform.scale(
                      scale: 0.8 + (0.2 * _fadeAnimation.value),
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.format_quote,
                              size: 80,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              _quotes[index],
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Trang ${index + 1}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_currentPage < _quotes.length - 1) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else {
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

// 4. Demo tổng hợp tất cả PageView
class PageViewMainDemo extends StatefulWidget {
  const PageViewMainDemo({super.key});

  @override
  State<PageViewMainDemo> createState() => _PageViewMainDemoState();
}

class _PageViewMainDemoState extends State<PageViewMainDemo> {
  int _selectedDemo = 0;

  final List<Widget> _demos = [
    const BasicPageViewDemo(),
    const ImagePageViewDemo(),
    const AnimatedPageViewDemo(),
  ];

  final List<String> _demoNames = [
    'PageView Cơ Bản',
    'PageView với Ảnh',
    'PageView với Animation',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Examples'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<int>(
                    value: _selectedDemo,
                    isExpanded: true,
                    items: List.generate(_demos.length, (index) {
                      return DropdownMenuItem(
                        value: index,
                        child: Text(_demoNames[index]),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        _selectedDemo = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: _demos[_selectedDemo]),
        ],
      ),
    );
  }
}
