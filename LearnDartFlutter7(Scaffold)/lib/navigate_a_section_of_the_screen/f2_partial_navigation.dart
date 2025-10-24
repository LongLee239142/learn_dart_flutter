import 'package:flutter/material.dart';

class F2PartialNavigation extends StatelessWidget {
  const F2PartialNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partial Navigation Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const PartialNavigationHomeScreen(),
    );
  }
}

class PartialNavigationHomeScreen extends StatelessWidget {
  const PartialNavigationHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partial Navigation Examples'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose Partial Navigation Type:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageViewNavigationScreen(),
                  ),
                );
              },
              child: const Text('PageView Navigation'),
            ),
            const SizedBox(height: 12),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IndexedStackNavigationScreen(),
                  ),
                );
              },
              child: const Text('IndexedStack Navigation'),
            ),
            const SizedBox(height: 12),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NestedNavigatorScreen(),
                  ),
                );
              },
              child: const Text('Nested Navigator'),
            ),
            const SizedBox(height: 12),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabViewNavigationScreen(),
                  ),
                );
              },
              child: const Text('Tab View Navigation'),
            ),
            const SizedBox(height: 12),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConditionalNavigationScreen(),
                  ),
                );
              },
              child: const Text('Conditional Navigation'),
            ),
          ],
        ),
      ),
    );
  }
}

// PageView Navigation Screen
class PageViewNavigationScreen extends StatefulWidget {
  const PageViewNavigationScreen({super.key});

  @override
  State<PageViewNavigationScreen> createState() => _PageViewNavigationScreenState();
}

class _PageViewNavigationScreenState extends State<PageViewNavigationScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Navigation'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Page Indicator
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
          ),
          
          // PageView Content
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                PageContent(
                  title: 'Page 1',
                  content: 'This is the first page content. You can swipe to navigate between pages.',
                  color: Colors.blue,
                  icon: Icons.home,
                ),
                PageContent(
                  title: 'Page 2',
                  content: 'This is the second page content. Swipe left or right to navigate.',
                  color: Colors.green,
                  icon: Icons.search,
                ),
                PageContent(
                  title: 'Page 3',
                  content: 'This is the third page content. Navigation happens within this section only.',
                  color: Colors.orange,
                  icon: Icons.person,
                ),
              ],
            ),
          ),
          
          // Navigation Controls
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _currentPage > 0 ? () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } : null,
                  child: const Text('Previous'),
                ),
                Text('Page ${_currentPage + 1} of 3'),
                ElevatedButton(
                  onPressed: _currentPage < 2 ? () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } : null,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// IndexedStack Navigation Screen
class IndexedStackNavigationScreen extends StatefulWidget {
  const IndexedStackNavigationScreen({super.key});

  @override
  State<IndexedStackNavigationScreen> createState() => _IndexedStackNavigationScreenState();
}

class _IndexedStackNavigationScreenState extends State<IndexedStackNavigationScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndexedStack Navigation'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            height: 60,
            child: Row(
              children: [
                _buildTab(0, 'Home', Icons.home),
                _buildTab(1, 'Search', Icons.search),
                _buildTab(2, 'Profile', Icons.person),
                _buildTab(3, 'Settings', Icons.settings),
              ],
            ),
          ),
          
          // Content Area
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: const [
                TabContent(
                  title: 'Home Tab',
                  content: 'This is the home tab content. State is preserved when switching tabs.',
                  color: Colors.blue,
                  icon: Icons.home,
                ),
                TabContent(
                  title: 'Search Tab',
                  content: 'This is the search tab content. Each tab maintains its own state.',
                  color: Colors.green,
                  icon: Icons.search,
                ),
                TabContent(
                  title: 'Profile Tab',
                  content: 'This is the profile tab content. Navigation happens within this section.',
                  color: Colors.orange,
                  icon: Icons.person,
                ),
                TabContent(
                  title: 'Settings Tab',
                  content: 'This is the settings tab content. Only this section changes.',
                  color: Colors.purple,
                  icon: Icons.settings,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(int index, String title, IconData icon) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.purple[100] : Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.purple : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.purple : Colors.grey,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.purple : Colors.grey,
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Nested Navigator Screen
class NestedNavigatorScreen extends StatefulWidget {
  const NestedNavigatorScreen({super.key});

  @override
  State<NestedNavigatorScreen> createState() => _NestedNavigatorScreenState();
}

class _NestedNavigatorScreenState extends State<NestedNavigatorScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested Navigator'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              _navigatorKey.currentState?.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: Column(
        children: [
          // Navigation Controls
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _navigatorKey.currentState?.push(
                      MaterialPageRoute(
                        builder: (context) => const NestedPage(title: 'Nested Page 1'),
                      ),
                    );
                  },
                  child: const Text('Push Page 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _navigatorKey.currentState?.push(
                      MaterialPageRoute(
                        builder: (context) => const NestedPage(title: 'Nested Page 2'),
                      ),
                    );
                  },
                  child: const Text('Push Page 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _navigatorKey.currentState?.pop();
                  },
                  child: const Text('Pop'),
                ),
              ],
            ),
          ),
          
          // Nested Navigator
          Expanded(
            child: Navigator(
              key: _navigatorKey,
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) => const NestedHomePage(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NestedHomePage extends StatelessWidget {
  const NestedHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.navigation, size: 80, color: Colors.teal),
            SizedBox(height: 20),
            Text(
              'Nested Navigator Home',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'This is the home page of the nested navigator. Use the buttons above to navigate within this section.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class NestedPage extends StatelessWidget {
  final String title;

  const NestedPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pages, size: 80, color: Colors.teal),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This page was pushed within the nested navigator. Only this section changes.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// Tab View Navigation Screen
class TabViewNavigationScreen extends StatefulWidget {
  const TabViewNavigationScreen({super.key});

  @override
  State<TabViewNavigationScreen> createState() => _TabViewNavigationScreenState();
}

class _TabViewNavigationScreenState extends State<TabViewNavigationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab View Navigation'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.search), text: 'Search'),
            Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TabContent(
            title: 'Home Tab',
            content: 'This is the home tab. Navigation happens within the tab content area only.',
            color: Colors.blue,
            icon: Icons.home,
          ),
          TabContent(
            title: 'Search Tab',
            content: 'This is the search tab. The app bar and tab bar remain unchanged.',
            color: Colors.green,
            icon: Icons.search,
          ),
          TabContent(
            title: 'Favorites Tab',
            content: 'This is the favorites tab. Only the content area changes.',
            color: Colors.red,
            icon: Icons.favorite,
          ),
          TabContent(
            title: 'Settings Tab',
            content: 'This is the settings tab. Partial navigation in action.',
            color: Colors.purple,
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}

// Conditional Navigation Screen
class ConditionalNavigationScreen extends StatefulWidget {
  const ConditionalNavigationScreen({super.key});

  @override
  State<ConditionalNavigationScreen> createState() => _ConditionalNavigationScreenState();
}

class _ConditionalNavigationScreenState extends State<ConditionalNavigationScreen> {
  String _currentView = 'home';
  Map<String, dynamic> _data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditional Navigation'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Navigation Controls
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentView = 'home';
                    });
                  },
                  child: const Text('Home'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentView = 'profile';
                    });
                  },
                  child: const Text('Profile'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentView = 'settings';
                    });
                  },
                  child: const Text('Settings'),
                ),
              ],
            ),
          ),
          
          // Conditional Content
          Expanded(
            child: _buildCurrentView(),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentView() {
    switch (_currentView) {
      case 'home':
        return _buildHomeView();
      case 'profile':
        return _buildProfileView();
      case 'settings':
        return _buildSettingsView();
      default:
        return _buildHomeView();
    }
  }

  Widget _buildHomeView() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Icon(Icons.home, size: 80, color: Colors.blue),
          const SizedBox(height: 20),
          const Text(
            'Home View',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'This is the home view. Content changes based on navigation state.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _data['home_action'] = 'Button clicked at ${DateTime.now()}';
              });
            },
            child: const Text('Update Data'),
          ),
          if (_data['home_action'] != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _data['home_action'],
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProfileView() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Icon(Icons.person, size: 80, color: Colors.green),
          const SizedBox(height: 20),
          const Text(
            'Profile View',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'This is the profile view. State is maintained across navigation.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _data['profile_action'] = 'Profile updated at ${DateTime.now()}';
              });
            },
            child: const Text('Update Profile'),
          ),
          if (_data['profile_action'] != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _data['profile_action'],
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSettingsView() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Icon(Icons.settings, size: 80, color: Colors.orange),
          const SizedBox(height: 20),
          const Text(
            'Settings View',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'This is the settings view. Only this section changes during navigation.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _data['settings_action'] = 'Settings saved at ${DateTime.now()}';
              });
            },
            child: const Text('Save Settings'),
          ),
          if (_data['settings_action'] != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _data['settings_action'],
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }
}

// Reusable Page Content Widget
class PageContent extends StatelessWidget {
  final String title;
  final String content;
  final Color color;
  final IconData icon;

  const PageContent({
    super.key,
    required this.title,
    required this.content,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: color),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Tab Content Widget
class TabContent extends StatelessWidget {
  final String title;
  final String content;
  final Color color;
  final IconData icon;

  const TabContent({
    super.key,
    required this.title,
    required this.content,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: color),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
