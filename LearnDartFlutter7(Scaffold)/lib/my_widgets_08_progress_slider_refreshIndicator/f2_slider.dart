import 'package:flutter/material.dart';

class F2Slider extends StatefulWidget {
  const F2Slider({super.key});

  @override
  State<F2Slider> createState() => _F2SliderState();
}

class _F2SliderState extends State<F2Slider> {
  double _basicSliderValue = 0.5;
  double _rangeSliderStart = 0.2;
  double _rangeSliderEnd = 0.8;
  double _discreteSliderValue = 25.0;
  double _customSliderValue = 0.0;
  double _volumeValue = 0.5;
  double _brightnessValue = 0.7;
  double _temperatureValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Examples'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Slider
            _buildSectionTitle('Basic Slider'),
            const SizedBox(height: 20),
            
            _buildCard(
              'Simple Slider',
              Column(
                children: [
                  Text('Value: ${_basicSliderValue.toStringAsFixed(2)}'),
                  const SizedBox(height: 20),
                  Slider(
                    value: _basicSliderValue,
                    onChanged: (value) {
                      setState(() {
                        _basicSliderValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Range Slider
            _buildSectionTitle('Range Slider'),
            const SizedBox(height: 20),
            
            _buildCard(
              'Range Slider',
              Column(
                children: [
                  Text('Start: ${_rangeSliderStart.toStringAsFixed(2)}'),
                  Text('End: ${_rangeSliderEnd.toStringAsFixed(2)}'),
                  const SizedBox(height: 20),
                  RangeSlider(
                    values: RangeValues(_rangeSliderStart, _rangeSliderEnd),
                    onChanged: (values) {
                      setState(() {
                        _rangeSliderStart = values.start;
                        _rangeSliderEnd = values.end;
                      });
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Discrete Slider
            _buildSectionTitle('Discrete Slider'),
            const SizedBox(height: 20),
            
            _buildCard(
              'Discrete Slider (18-65)',
              Column(
                children: [
                  Text('Value: ${_discreteSliderValue.toInt()}'),
                  const SizedBox(height: 20),
                  Slider(
                    value: _discreteSliderValue,
                    min: 18,
                    max: 65,
                    divisions: 47,
                    label: _discreteSliderValue.toInt().toString(),
                    onChanged: (value) {
                      setState(() {
                        _discreteSliderValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Custom Styled Slider
            _buildSectionTitle('Custom Styled Slider'),
            const SizedBox(height: 20),
            
            _buildCard(
              'Custom Slider',
              Column(
                children: [
                  Text('Value: ${_customSliderValue.toStringAsFixed(2)}'),
                  const SizedBox(height: 20),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.purple,
                      inactiveTrackColor: Colors.purple.withOpacity(0.3),
                      thumbColor: Colors.purple,
                      overlayColor: Colors.purple.withOpacity(0.2),
                      valueIndicatorColor: Colors.purple,
                      valueIndicatorTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Slider(
                      value: _customSliderValue,
                      onChanged: (value) {
                        setState(() {
                          _customSliderValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Practical Examples
            _buildSectionTitle('Practical Examples'),
            const SizedBox(height: 20),
            
            // Volume Control
            _buildCard(
              'Volume Control',
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.volume_down),
                      Expanded(
                        child: Slider(
                          value: _volumeValue,
                          onChanged: (value) {
                            setState(() {
                              _volumeValue = value;
                            });
                          },
                        ),
                      ),
                      const Icon(Icons.volume_up),
                    ],
                  ),
                  Text('Volume: ${(_volumeValue * 100).toInt()}%'),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Brightness Control
            _buildCard(
              'Brightness Control',
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.brightness_low),
                      Expanded(
                        child: Slider(
                          value: _brightnessValue,
                          activeColor: Colors.orange,
                          inactiveColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _brightnessValue = value;
                            });
                          },
                        ),
                      ),
                      const Icon(Icons.brightness_high),
                    ],
                  ),
                  Text('Brightness: ${(_brightnessValue * 100).toInt()}%'),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Temperature Control
            _buildCard(
              'Temperature Control',
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.ac_unit, color: Colors.blue),
                      Expanded(
                        child: Slider(
                          value: _temperatureValue,
                          min: 0,
                          max: 40,
                          divisions: 40,
                          label: '${_temperatureValue.toInt()}°C',
                          activeColor: _temperatureValue < 20 
                              ? Colors.blue 
                              : _temperatureValue < 30 
                                  ? Colors.green 
                                  : Colors.red,
                          onChanged: (value) {
                            setState(() {
                              _temperatureValue = value;
                            });
                          },
                        ),
                      ),
                      const Icon(Icons.whatshot, color: Colors.red),
                    ],
                  ),
                  Text('Temperature: ${_temperatureValue.toInt()}°C'),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Slider with Labels
            _buildCard(
              'Slider with Labels',
              Column(
                children: [
                  const Text('Choose your age range:'),
                  const SizedBox(height: 20),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                      showValueIndicator: ShowValueIndicator.always,
                    ),
                    child: Slider(
                      value: _discreteSliderValue,
                      min: 18,
                      max: 65,
                      divisions: 47,
                      label: '${_discreteSliderValue.toInt()} years',
                      onChanged: (value) {
                        setState(() {
                          _discreteSliderValue = value;
                        });
                      },
                    ),
                  ),
                  Text('Age: ${_discreteSliderValue.toInt()} years'),
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
        color: Colors.teal,
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
}
