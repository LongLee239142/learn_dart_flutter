import 'package:flutter/material.dart';

class F1Progress extends StatefulWidget {
  const F1Progress({super.key});

  @override
  State<F1Progress> createState() => _F1ProgressState();
}

class _F1ProgressState extends State<F1Progress> with TickerProviderStateMixin {
  late AnimationController _animationController;
  double _progressValue = 0.0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular Progress Indicators
            _buildSectionTitle('Circular Progress Indicators'),
            const SizedBox(height: 20),
            
            // Basic Circular Progress
            _buildCard(
              'Basic Circular Progress',
              Column(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                    strokeWidth: 5,
                  ),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    strokeWidth: 8,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Animated Circular Progress
            _buildCard(
              'Animated Circular Progress',
              Column(
                children: [
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return CircularProgressIndicator(
                        value: _animationController.value,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                        strokeWidth: 6,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _animationController.forward(),
                        child: const Text('Start'),
                      ),
                      ElevatedButton(
                        onPressed: () => _animationController.reset(),
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Linear Progress Indicators
            _buildSectionTitle('Linear Progress Indicators'),
            const SizedBox(height: 20),
            
            _buildCard(
              'Basic Linear Progress',
              Column(
                children: [
                  const LinearProgressIndicator(),
                  const SizedBox(height: 20),
                  const LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    backgroundColor: Colors.grey,
                    minHeight: 8,
                  ),
                  const SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: _progressValue,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                    backgroundColor: Colors.grey[300],
                    minHeight: 10,
                  ),
                  const SizedBox(height: 20),
                  Slider(
                    value: _progressValue,
                    onChanged: (value) {
                      setState(() {
                        _progressValue = value;
                      });
                    },
                  ),
                  Text('Progress: ${(_progressValue * 100).toInt()}%'),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Loading States
            _buildSectionTitle('Loading States'),
            const SizedBox(height: 20),
            
            _buildCard(
              'Loading Button',
              Column(
                children: [
                  ElevatedButton(
                    onPressed: _isLoading ? null : _simulateLoading,
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text('Start Loading'),
                  ),
                  const SizedBox(height: 20),
                  if (_isLoading)
                    const Text('Loading... Please wait'),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Progress with Text
            _buildCard(
              'Progress with Text',
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          value: _progressValue,
                          strokeWidth: 8,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                        ),
                      ),
                      Text(
                        '${(_progressValue * 100).toInt()}%',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  }

  Widget _buildCard(String title, Widget content) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }

  Future<void> _simulateLoading() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate loading for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Loading completed!')),
      );
    }
  }
}


