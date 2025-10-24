import 'package:flutter/material.dart';

class F1PopScopeExamples extends StatelessWidget {
  const F1PopScopeExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopScope Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const PopScopeHomePage(),
    );
  }
}

class PopScopeHomePage extends StatelessWidget {
  const PopScopeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopScope Examples'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'PopScope Widget Examples',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            
            // Example 1: Basic PopScope
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BasicPopScopeExample(),
                  ),
                );
              },
              child: const Text('1. Basic PopScope Example'),
            ),
            const SizedBox(height: 10),
            
            // Example 2: PopScope with Confirmation Dialog
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PopScopeWithDialogExample(),
                  ),
                );
              },
              child: const Text('2. PopScope with Confirmation Dialog'),
            ),
            const SizedBox(height: 10),
            
            // Example 3: PopScope with Form Validation
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PopScopeWithFormExample(),
                  ),
                );
              },
              child: const Text('3. PopScope with Form Validation'),
            ),
            const SizedBox(height: 10),
            
            // Example 4: PopScope with Custom Logic
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PopScopeCustomLogicExample(),
                  ),
                );
              },
              child: const Text('4. PopScope with Custom Logic'),
            ),
            const SizedBox(height: 10),
            
            // Example 5: PopScope with Animation
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PopScopeWithAnimationExample(),
                  ),
                );
              },
              child: const Text('5. PopScope with Animation'),
            ),
          ],
        ),
      ),
    );
  }
}

// Example 1: Basic PopScope
class BasicPopScopeExample extends StatelessWidget {
  const BasicPopScopeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true, // Cho phép pop về màn hình trước
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Basic PopScope'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 80,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              Text(
                'This page can be popped normally',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Press back button or swipe back to return',
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

// Example 2: PopScope with Confirmation Dialog
class PopScopeWithDialogExample extends StatefulWidget {
  const PopScopeWithDialogExample({super.key});

  @override
  State<PopScopeWithDialogExample> createState() => _PopScopeWithDialogExampleState();
}

class _PopScopeWithDialogExampleState extends State<PopScopeWithDialogExample> {
  bool _hasUnsavedChanges = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_hasUnsavedChanges, // Chỉ cho phép pop khi không có thay đổi chưa lưu
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop && _hasUnsavedChanges) {
          // Hiển thị dialog xác nhận khi có thay đổi chưa lưu
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Unsaved Changes'),
              content: const Text('You have unsaved changes. Do you want to leave without saving?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Leave'),
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
          title: const Text('PopScope with Dialog'),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Toggle the switch to simulate unsaved changes',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: const Text('Has Unsaved Changes'),
                value: _hasUnsavedChanges,
                onChanged: (value) {
                  setState(() {
                    _hasUnsavedChanges = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                _hasUnsavedChanges 
                  ? '⚠️ You have unsaved changes. Try to go back!'
                  : '✅ No unsaved changes. You can go back safely.',
                style: TextStyle(
                  fontSize: 16,
                  color: _hasUnsavedChanges ? Colors.red : Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example 3: PopScope with Form Validation
class PopScopeWithFormExample extends StatefulWidget {
  const PopScopeWithFormExample({super.key});

  @override
  State<PopScopeWithFormExample> createState() => _PopScopeWithFormExampleState();
}

class _PopScopeWithFormExampleState extends State<PopScopeWithFormExample> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isFormDirty = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onFormChanged);
    _emailController.addListener(_onFormChanged);
  }

  void _onFormChanged() {
    setState(() {
      _isFormDirty = _nameController.text.isNotEmpty || _emailController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isFormDirty,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop && _isFormDirty) {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Form Not Saved'),
              content: const Text('You have unsaved form data. Do you want to discard your changes?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Keep Editing'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Discard'),
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
          title: const Text('PopScope with Form'),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isFormDirty = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form saved successfully!')),
                      );
                    }
                  },
                  child: const Text('Save Form'),
                ),
                const SizedBox(height: 20),
                Text(
                  _isFormDirty 
                    ? '⚠️ Form has unsaved changes'
                    : '✅ Form is saved',
                  style: TextStyle(
                    fontSize: 16,
                    color: _isFormDirty ? Colors.red : Colors.green,
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

// Example 4: PopScope with Custom Logic
class PopScopeCustomLogicExample extends StatefulWidget {
  const PopScopeCustomLogicExample({super.key});

  @override
  State<PopScopeCustomLogicExample> createState() => _PopScopeCustomLogicExampleState();
}

class _PopScopeCustomLogicExampleState extends State<PopScopeCustomLogicExample> {
  int _counter = 0;
  bool _canPop = true;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPop,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          // Custom logic: Chỉ cho phép pop khi counter là số chẵn
          if (_counter % 2 == 0) {
            Navigator.of(context).pop();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Cannot pop! Counter ($_counter) is odd. Make it even to pop.'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PopScope Custom Logic'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.smart_toy,
                size: 80,
                color: Colors.teal,
              ),
              const SizedBox(height: 20),
              Text(
                'Counter: $_counter',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                _counter % 2 == 0 
                  ? '✅ Even number - You can pop!'
                  : '❌ Odd number - Cannot pop!',
                style: TextStyle(
                  fontSize: 16,
                  color: _counter % 2 == 0 ? Colors.green : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
                child: const Text('Increment Counter'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Try to go back with different counter values!',
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

// Example 5: PopScope with Animation
class PopScopeWithAnimationExample extends StatefulWidget {
  const PopScopeWithAnimationExample({super.key});

  @override
  State<PopScopeWithAnimationExample> createState() => _PopScopeWithAnimationExampleState();
}

class _PopScopeWithAnimationExampleState extends State<PopScopeWithAnimationExample>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isAnimating,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop && !_isAnimating) {
          // Bắt đầu animation trước khi pop
          setState(() {
            _isAnimating = true;
          });
          
          await _animationController.forward();
          
          // Pop sau khi animation hoàn thành
          if (mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PopScope with Animation'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.animation,
                      size: 80,
                      color: Colors.indigo,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'This page has animated exit',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _isAnimating 
                        ? 'Animating...' 
                        : 'Try to go back!',
                      style: TextStyle(
                        fontSize: 16,
                        color: _isAnimating ? Colors.orange : Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _isAnimating ? null : () {
                        setState(() {
                          _isAnimating = true;
                        });
                        _animationController.forward().then((_) {
                          if (mounted) {
                            Navigator.of(context).pop();
                          }
                        });
                      },
                      child: Text(_isAnimating ? 'Animating...' : 'Animated Exit'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
