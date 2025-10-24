import 'package:flutter/material.dart';

class F3AdvancedNavigation extends StatelessWidget {
  const F3AdvancedNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Navigation Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const AdvancedNavigationHome(),
    );
  }
}

class AdvancedNavigationHome extends StatelessWidget {
  const AdvancedNavigationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Navigation'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Advanced Navigation Examples',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HeroAnimationScreen(),
                  ),
                );
              },
              child: const Text('Hero Animations'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomTransitionScreen(),
                  ),
                );
              },
              child: const Text('Custom Transitions'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NestedNavigationScreen(),
                  ),
                );
              },
              child: const Text('Nested Navigation'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WillPopScopeScreen(),
                  ),
                );
              },
              child: const Text('WillPopScope Example'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RouteObserverScreen(),
                  ),
                );
              },
              child: const Text('Route Observer'),
            ),
          ],
        ),
      ),
    );
  }
}

// Hero Animation Screen
class HeroAnimationScreen extends StatelessWidget {
  const HeroAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animations'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Tap on the cards to see Hero animations',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildHeroCard(
                    context,
                    'Card 1',
                    Colors.red,
                    Icons.favorite,
                    const DetailScreen(
                      title: 'Card 1 Details',
                      color: Colors.red,
                      icon: Icons.favorite,
                    ),
                  ),
                  _buildHeroCard(
                    context,
                    'Card 2',
                    Colors.green,
                    Icons.star,
                    const DetailScreen(
                      title: 'Card 2 Details',
                      color: Colors.green,
                      icon: Icons.star,
                    ),
                  ),
                  _buildHeroCard(
                    context,
                    'Card 3',
                    Colors.blue,
                    Icons.thumb_up,
                    const DetailScreen(
                      title: 'Card 3 Details',
                      color: Colors.blue,
                      icon: Icons.thumb_up,
                    ),
                  ),
                  _buildHeroCard(
                    context,
                    'Card 4',
                    Colors.orange,
                    Icons.rocket_launch,
                    const DetailScreen(
                      title: 'Card 4 Details',
                      color: Colors.orange,
                      icon: Icons.rocket_launch,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroCard(
    BuildContext context,
    String title,
    Color color,
    IconData icon,
    Widget detailScreen,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => detailScreen),
        );
      },
      child: Hero(
        tag: title,
        child: Card(
          elevation: 8,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 48,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  const DetailScreen({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: title,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  icon,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'This is a detailed view with Hero animation',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
              ),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Transition Screen
class CustomTransitionScreen extends StatelessWidget {
  const CustomTransitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Transitions'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Choose a transition type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const TransitionTargetScreen(title: 'Slide Transition'),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: animation.drive(
                          Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.easeInOut)),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 500),
                  ),
                );
              },
              child: const Text('Slide Transition'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const TransitionTargetScreen(title: 'Scale Transition'),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: animation.drive(
                          Tween(begin: 0.0, end: 1.0)
                              .chain(CurveTween(curve: Curves.elasticOut)),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 800),
                  ),
                );
              },
              child: const Text('Scale Transition'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const TransitionTargetScreen(title: 'Rotation Transition'),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return RotationTransition(
                        turns: animation.drive(
                          Tween(begin: 0.0, end: 1.0)
                              .chain(CurveTween(curve: Curves.easeInOut)),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 600),
                  ),
                );
              },
              child: const Text('Rotation Transition'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const TransitionTargetScreen(title: 'Fade Transition'),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation.drive(
                          Tween(begin: 0.0, end: 1.0)
                              .chain(CurveTween(curve: Curves.easeInOut)),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 400),
                  ),
                );
              },
              child: const Text('Fade Transition'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const TransitionTargetScreen(title: 'Complex Transition'),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: animation.drive(
                          Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.easeInOut)),
                        ),
                        child: FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: animation.drive(
                              Tween(begin: 0.8, end: 1.0)
                                  .chain(CurveTween(curve: Curves.easeOut)),
                            ),
                            child: child,
                          ),
                        ),
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 700),
                  ),
                );
              },
              child: const Text('Complex Transition'),
            ),
          ],
        ),
      ),
    );
  }
}

class TransitionTargetScreen extends StatelessWidget {
  final String title;

  const TransitionTargetScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.animation,
              size: 100,
              color: Colors.indigo,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This screen was opened with a custom transition!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// Nested Navigation Screen
class NestedNavigationScreen extends StatefulWidget {
  const NestedNavigationScreen({super.key});

  @override
  State<NestedNavigationScreen> createState() => _NestedNavigationScreenState();
}

class _NestedNavigationScreenState extends State<NestedNavigationScreen> {
  int _selectedIndex = 0;
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested Navigation'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildNavigator(0, const HomeTabScreen()),
          _buildNavigator(1, const SearchTabScreen()),
          _buildNavigator(2, const ProfileTabScreen()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildNavigator(int index, Widget initialRoute) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => initialRoute,
        );
      },
    );
  }
}

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Home Tab',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NestedDetailScreen(title: 'Home Detail'),
                  ),
                );
              },
              child: const Text('Go to Home Detail'),
            ),
          ],
        ),
    );
  }
}

class SearchTabScreen extends StatelessWidget {
  const SearchTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Search Tab',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NestedDetailScreen(title: 'Search Detail'),
                  ),
                );
              },
              child: const Text('Go to Search Detail'),
            ),
          ],
        ),
    );
  }
}

class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile Tab',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NestedDetailScreen(title: 'Profile Detail'),
                  ),
                );
              },
              child: const Text('Go to Profile Detail'),
            ),
          ],
        ),
      );
  }
}

class NestedDetailScreen extends StatelessWidget {
  final String title;

  const NestedDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'This is a nested navigation detail screen',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// WillPopScope Screen
class WillPopScopeScreen extends StatefulWidget {
  const WillPopScopeScreen({super.key});

  @override
  State<WillPopScopeScreen> createState() => _WillPopScopeScreenState();
}

class _WillPopScopeScreenState extends State<WillPopScopeScreen> {
  bool _hasUnsavedChanges = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_hasUnsavedChanges) {
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Unsaved Changes'),
              content: const Text('You have unsaved changes. Are you sure you want to leave?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Leave'),
                ),
              ],
            ),
          ) ?? false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WillPopScope Example'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'WillPopScope Example',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'This screen demonstrates how to intercept the back button press.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              SwitchListTile(
                title: const Text('Has Unsaved Changes'),
                subtitle: const Text('Toggle to simulate unsaved changes'),
                value: _hasUnsavedChanges,
                onChanged: (value) {
                  setState(() {
                    _hasUnsavedChanges = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'How it works:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('• When "Has Unsaved Changes" is OFF, back button works normally'),
                      Text('• When "Has Unsaved Changes" is ON, back button shows confirmation dialog'),
                      Text('• This is useful for forms with unsaved data'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Route Observer Screen
class RouteObserverScreen extends StatefulWidget {
  const RouteObserverScreen({super.key});

  @override
  State<RouteObserverScreen> createState() => _RouteObserverScreenState();
}

class _RouteObserverScreenState extends State<RouteObserverScreen> with RouteAware {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final List<String> _routeEvents = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Register this screen with the route observer
    // Note: In a real app, you would get this from a provider or context
  }

  @override
  void didPopNext() {
    _addEvent('didPopNext - Screen became visible again');
  }

  @override
  void didPushNext() {
    _addEvent('didPushNext - Screen was pushed over');
  }

  @override
  void didPop() {
    _addEvent('didPop - Screen was popped');
  }

  @override
  void didPush() {
    _addEvent('didPush - Screen was pushed');
  }

  void _addEvent(String event) {
    setState(() {
      _routeEvents.insert(0, '${DateTime.now().toString().substring(11, 19)}: $event');
      if (_routeEvents.length > 10) {
        _routeEvents.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Route Observer'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Route Observer Example',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This screen tracks route lifecycle events. Navigate to other screens to see events.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RouteObserverDetailScreen(),
                  ),
                );
              },
              child: const Text('Push Detail Screen'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RouteObserverDetailScreen(),
                  ),
                );
              },
              child: const Text('Replace with Detail Screen'),
            ),
            const SizedBox(height: 20),

            const Text(
              'Route Events:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: _routeEvents.isEmpty
                    ? const Text('No events yet. Navigate to other screens to see events.')
                    : ListView.builder(
                        itemCount: _routeEvents.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              _routeEvents[index],
                              style: const TextStyle(fontSize: 14),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RouteObserverDetailScreen extends StatelessWidget {
  const RouteObserverDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Detail Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'This screen will trigger route events in the previous screen.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
